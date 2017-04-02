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
use System\Classes\ModelBehavior;

class OrderModel extends ModelBehavior
{
    public function __construct($model)
    {
        parent::__construct($model);
    }

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

    public function calculateShipment($method)
    {
        if($method->calculator == 'flat_rate'){
            $amounts = explode($method->amount);
            $amount = $amounts[0]."".$amounts[1];
            return $amount;
        }elseif($method == 'per_unit_rate'){
            $amounts = explode($method->amount * $this->model->order_items->count());
            $amount = $amounts[0]."".$amounts[1];
            return $amount;
        }
    }


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
        $shipping = Adjustment::sumAdjustment($this->model, Shipment::SHIPMENT_TYPE);
        $this->model->tax = number_format(($taxes/100), 2);
        $this->model->shipping = number_format($shipping, 2);
        $this->model->total = $this->model->subtotal + $this->model->tax + $this->model->shipping;
        $this->model->save();
    }

    public function addTaxAdjustment($adjustment)
    {
        $rate = $adjustment->amount;
        $tax_adjustement = new Adjustment();
        $tax_adjustement->orderable_id = $this->model->id;
        $tax_adjustement->orderable_type = get_class($this->model);
        $tax_adjustement->type = TaxRate::TAX_TYPE;
        $tax_adjustement->name = $adjustment->name;
        $tax_adjustement->amount = (int)$rate;
        $tax_adjustement->is_neutral = $adjustment->is_neutral;
        $tax_adjustement->is_locked = $adjustment->is_locked;
        $tax_adjustement->save();
    }

    public function updateTaxAdjustment($amount){
        $adjustment = Adjustment::FindByTaxOrderable($this->model)->first();
        if($adjustment->exists){
            $adjustment->amount = (int) $amount;
            $adjustment->save();
        }
    }

    public function addShipmentAdjustement()
    {
        $method = ShippingMethod::find($this->model->shipment->shipping_method_id);
        $adjustment = new Adjustment();
        $adjustment->orderable_id = $this->model->id;
        $adjustment->orderable_type = get_class($this->model);
        $adjustment->type = Shipment::SHIPMENT_TYPE;
        $adjustment->name = $method->name;
        $adjustment->amount = self::calculateShipment($method);
        $adjustment->is_neutral = false;
        $adjustment->is_locked = false;
        $adjustment->save();
        self::updateTotals();
    }

    public function calculateAdjustments()
    {
        $total = 0;
        foreach($this->model->adjustments as $adjustment)
        {
            $total += $adjustment->amount;
        }
        return $total;
    }
}