<?php
/**
 * Created by PhpStorm.
 * User: andres
 * Date: 5/02/17
 * Time: 10:01
 */

namespace istheweb\shop\behaviors;


use istheweb\shop\classes\AvailabilityChecker;
use Istheweb\Shop\Models\Adjustment;
use Istheweb\Shop\Models\InventoryUnit;
use Istheweb\Shop\Models\TaxRate;
use System\Classes\ModelBehavior;

class OrderItemModel extends ModelBehavior
{

    public $tax_adjustment;

    public function __construct( $model )
    {
        parent::__construct($model);
    }

    public function calculateTotal()
    {

    }

    public function getTotalItem()
    {
        $id = post('OrderItem[productable]');
        $quantity = post('OrderItem[quantity]');

        $className = $this->model->productable_type;
        $instance = new $className;
        $item = $instance->find($id)->first();

        $availabilityChecker = new AvailabilityChecker(false);

        if($item->isTracked()){
            /**
             * TODO: It does not work actually
             */
            if($availabilityChecker->isStockSufficient($item, $quantity)){
                $inventoryUnit = new InventoryUnit();
                $inventoryUnit->hold($item, $quantity);
            }else{
                /**
                 * TODO: Implement not sufficient Stock response
                 */
            }
        }

        //dd(dump($item));

        $this->model->unit_price = $item->price;
        $this->model->unit_total = $item->price * $quantity;
        $this->model->total = $this->model->unit_total;
    }

    public function getProductable($id, $type)
    {
        $className = $type;
        $instance = new $className;
        $item = $instance->find($id);
        return $item;
    }

    public function checkAdjustements()
    {
        $adjustment = Adjustment::findByTaxOrderable($this->model)->first();
        if(is_null($adjustment)){
          $this->addAdjustment();
        }else{
          $this->updateAdjustment($adjustment);
        }
    }

    public function addAdjustment()
    {
        $adjustment = $this->model->productable->getTaxRate();
        $rate = $adjustment->calculate($this->model->total);

        $tax_adjustement = new Adjustment();
        $tax_adjustement->orderable_id = $this->model->id;
        $tax_adjustement->orderable_type = get_class($this->model);
        $tax_adjustement->type = TaxRate::TAX_TYPE;
        $tax_adjustement->name = $adjustment->name;
        $tax_adjustement->amount = (int)$rate;
        $tax_adjustement->is_neutral = false;
        $tax_adjustement->is_locked = false;
        $tax_adjustement->save();
        $this->model->order->addTaxAdjustment($tax_adjustement);
    }

    public function updateAdjustment($adjustment){
        if($adjustment->exists){
            $taxrate = $this->model->productable->getTaxRate();
            $rate = $taxrate->calculate($this->model->total);
            $adjustment->amount = (int) $rate;
            $adjustment->save();
            $this->model->order->updateTaxAdjustment($adjustment->amount);
        }
    }
}