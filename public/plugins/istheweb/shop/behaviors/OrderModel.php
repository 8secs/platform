<?php
/**
 * Created by PhpStorm.
 * User: andres
 * Date: 1/02/17
 * Time: 12:59
 */

namespace istheweb\shop\behaviors;


use Istheweb\Shop\Models\Adjustment;
use Istheweb\Shop\Models\Order;
use Istheweb\Shop\Models\Shipment;
use Istheweb\Shop\Models\ShippingMethod;
use Istheweb\Shop\Models\ShopSettings;
use Istheweb\Shop\Models\TaxRate;
use PayPal\Api\Tax;
use System\Classes\ModelBehavior;

/**
 * Class OrderModel
 * @package istheweb\shop\behaviors
 */
class OrderModel extends ModelBehavior
{
    public function __construct($model)
    {
        parent::__construct($model);
    }

    /**
     * Return order reference number from existing ones in datase
     * @return integer reference number
     */
    public function formatReference(){
        $shopSettings = ShopSettings::instance();
        $count = Order::all()->count();

        if($count == 0){
            $reference = $shopSettings->order_reference;
        }else{
            $last = Order::lastReference()->first();
            $reference = $last->reference + 1;
        }
        return $reference;
    }

    /**
     *
     */
    public function updateTotals()
    {
        $base = 0;
        if($this->model->order_items){
            foreach($this->model->order_items as $item){
                $base += $item->total;
            }
        }

        $this->model->subtotal = $base;
        $this->model->adjustments_total = $this->calculateAdjustments();
        $taxes = Adjustment::sumAdjustment($this->model, TaxRate::TAX_TYPE);
        $this->model->tax = self::formatAdjustemnt($taxes);
        if($this->model->hasShipment()){
            $shipping = Adjustment::sumAdjustment($this->model, Shipment::SHIPMENT_TYPE);
            $this->model->shipping = self::formatAdjustemnt($shipping);
        }

        $this->model->total = $this->model->subtotal + $this->model->tax + $this->model->shipping;
        $this->model->save();
    }

    /**
     *
     */
    public function checkAdjustments()
    {
        $shipment_adjust = Adjustment::findByShipping($this->model)->first();

        if(is_null($shipment_adjust)){
            self::addAdjustment();
        }else{
            $shipment_adjust->amount = $this->model->shipment->calculateShipment();
            $shipment_adjust->save();
        }
        self::updateTotals();
    }

    /**
     * @param $type
     * @param null $adjustment
     * @param bool $is_neutral
     * @param bool $is_locked
     */

    public function addAdjustment($adjustment = null){
        $adjust = new Adjustment();
        $adjust->orderable_id = $this->model->id;
        $adjust->orderable_type = get_class($this->model);

        if(!is_null($adjustment)){
            $adjust->type = $adjustment->type;
            $adjust->amount = $adjustment->amount;
            $adjust->name = $adjustment->name;
            $adjust->is_neutral = $adjustment->is_neutral;
            $adjust->is_locked = $adjustment->is_locked;
            $adjust->save();
        }else{
            $method = self::getShippingMethod();
            $adjust->name = $method->name;
            $adjust->amount = $this->model->shipment->calculateShipment();
            $adjust->type = Shipment::SHIPMENT_TYPE;
            $adjust->is_neutral = false;
            $adjust->is_locked = false;
            $adjust->save();
        }

        self::checkAdjustments();

        /*
        if($adjust->type == TaxRate::TAX_TYPE && $this->model->hasShipment()){
            $this->model->shipment->updateShipmentItems();
        }
        self::updateTotals();
        */
    }

    /**
     * @param $type
     * @param null $amount
     */
    public function updateAdjustment($adjust)
    {
        if($adjust->type == TaxRate::TAX_TYPE){
            $adjustment = Adjustment::FindByTaxOrderable($this->model)->first();
            if(!is_null($adjustment) && $adjustment->exists){
                $adjustment->amount = (int) $adjustment->amount;
                $adjustment->save();
                /*
                if($adjustment->type == TaxRate::TAX_TYPE && $this->model->hasShipment()){
                    $this->model->shipment->updateShipmentItems();
                }
                self::updateTotals();
                */
                self::checkAdjustments();
            }else{
                self::addAdjustment($adjust);
            }
        }
    }

    /**
     * @return int
     */
    public function calculateAdjustments()
    {
        $total = 0;
        foreach($this->model->adjustments as $adjustment)
        {
            $total += $adjustment->amount;
        }
        return $total;
    }

    /**
     * @return mixed
     */
    protected function getShippingMethod()
    {
        $shipment = $this->model->shipment;
        $method = $shipment->shipping_method_id;
        return ShippingMethod::find($method);
    }

    /**
     * @param $adjustment
     * @return string
     */
    protected function formatAdjustemnt($adjustment)
    {
        return number_format(($adjustment/100), 2);
    }
}