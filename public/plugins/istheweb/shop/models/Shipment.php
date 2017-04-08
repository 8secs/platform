<?php namespace Istheweb\Shop\Models;

use Doctrine\Common\Collections\ArrayCollection;

use Model;
use Request;

/**
 * Shipment Model
 */
class Shipment extends Model
{

    // Shipment default states.
    /**
     *
     */
    const STATE_CHECKOUT = 'checkout';
    /**
     *
     */
    const STATE_ONHOLD = 'onhold';
    /**
     *
     */
    const STATE_PENDING = 'pending';
    /**
     *
     */
    const STATE_READY = 'ready';
    /**
     *
     */
    const STATE_BACKORDERED = 'backordered';
    /**
     *
     */
    const STATE_SHIPPED = 'shipped';
    /**
     *
     */
    const STATE_RETURNED = 'returned';
    /**
     *
     */
    const STATE_CANCELLED = 'cancelled';

    /**
     *
     */
    const SHIPMENT_TYPE = 'shipment';

    /**
     * @var string The database table used by the model.
     */
    public $table = 'istheweb_shop_shipments';

    /**
     * @var array Implements bevaviors
     */
    public $implement = [
        'Istheweb.Shop.Behaviors.ShipmentModel'
    ];

    /**
     * @var array Guarded fields
     */
    protected $guarded = ['*'];

    /**
     * @var array Fillable fields
     */
    protected $fillable = [];

    /**
     * @var array Relations
     */

    public $hasMany = [
        'shipping_items' => 'Istheweb\Shop\Models\ShipmentItem',
    ];
    /**
     * @var array
     */
    public $belongsTo = [
        'order'             => 'Istheweb\Shop\Models\Order',
        'shipping_method'   => 'Istheweb\Shop\Models\ShippingMethod',
    ];


    /**
     * @param ShipmentItem $unit
     * @return mixed
     */
    public function hasUnit(ShipmentItem $unit){
        return $this->shipping_items->contains($unit);
    }

    /**
     * {@inheritdoc}
     */
    public function isTracked()
    {
        return null !== $this->tracking;
    }

    /**
     *
     */
    public function afterSave()
    {
        self::updateShipmentItems();
    }

    /**
     * @return array
     */
    public function getShippingMethodOptions()
    {
        if(!is_null($this->order)){
            return self::getMethods($this->order);
        }else{
           $id = Request::segment(6);
           $order = Order::with('order_items')->find($id);
           return self::getMethods($order);
        }
    }

    /**
     *
     */
    public function updateShipmentItems()
    {
        $products = self::getProductables($this->order);
        if($this->shipping_items->isEmpty()){
            if(is_array($products) && count($products) > 0){
                foreach($products as $product){
                    self::addShippingItem($product['id'], $product['type']);
                }
            }
        }else{
            foreach($this->shipping_items as $item){
                $product = array_first($products, function($value) use ($item){
                    $in = false;
                    if(!$item->shippable_id == $value['id']
                        && !$item->shippable_type == $value['type']) {
                        $in = true;
                    }
                    return $in;
                });
                if(!is_null($product)){
                    self::addShippingItem($product['id'], $product['type']);
                }
            }
        }
        $this->order->checkAdjustments();
    }

    /**
     * @return mixed
     */
    public function calculateShipment()
    {
        $total = 0;
        if($this->shipping_method->calculator == 'flat_rate'){
            $total = $this->shipping_method->amount;
        }elseif($this->shipping_method == 'per_unit_rate'){
            $total = $this->shipping_method->amount * $this->shipping_items->count();
            //dd(dump($total));
        }
        $amounts = explode( '.', $total);
        if(count($amounts) == 2){
            $amount = $amounts[0]."".$amounts[1];
        }else{
            $amount = $total."00";
        }
        return $amount;
    }

    /**
     * @param $order
     * @return array
     */
    protected function getMethods($order)
    {
        $products = self::getProductables($order, true);
        if(count($products) > 0){
            $methods = ShippingMethod::whereIn('shipping_category_id', $products)->lists('name', 'id');
            return $methods;
        }else{
            return ['' => '-- Tienes que añadir elementos al pedido --'];
        }
    }

    /**
     * @param $order
     * @return array
     */
    protected function getProductables($order, $is_cat = false)
    {
        $products = array();
        if(!$order->order_items->isEmpty()){
            foreach($order->order_items as $order_item)
            {
                $item = $order_item->productable;
                if(!$is_cat) {
                    array_push($products, ['id' => $item->id, 'type' => get_class($item)]);
                }else{
                    if(get_class($item) == 'Istheweb\Shop\Models\Variant'){
                        array_push($products, $item->product->shipping_category->id);
                    }else{
                        array_push($products, $item->shipping_category->id);
                    }
                }
            }
        }
        return $products;
    }

    /**
     * @param $id
     */
    protected function addShippingItem($id, $type)
    {
        $item = new ShipmentItem();
        $item->shipment = $this;
        $item->shippable_id = $id;
        $item->shippable_type = $type;
        $item->state = self::STATE_READY;
        $item->save();
        $this->shipping_items()->add($item);
    }
}
