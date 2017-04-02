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
    const STATE_CHECKOUT = 'checkout';
    const STATE_ONHOLD = 'onhold';
    const STATE_PENDING = 'pending';
    const STATE_READY = 'ready';
    const STATE_BACKORDERED = 'backordered';
    const STATE_SHIPPED = 'shipped';
    const STATE_RETURNED = 'returned';
    const STATE_CANCELLED = 'cancelled';

    const SHIPMENT_TYPE = 'shipment';

    /**
     * @var string The database table used by the model.
     */
    public $table = 'istheweb_shop_shipments';

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
    public $belongsTo = [
        'order'             => 'Istheweb\Shop\Models\Order',
        'shipping_method'   => 'Istheweb\Shop\Models\ShippingMethod',
    ];


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

    public function beforeSave()
    {

    }

    public function afterCreate()
    {
        self::createShipmentItems();
    }

    public function afterUpdate()
    {
        self::updateShipments();
    }

    protected function createShipmentItems()
    {
        $products = self::getProductables($this->order);
        foreach($products as $id){
            $item = new ShipmentItem();
            $item->shipment = $this;
            $item->shippable = Product::find($id);
            $item->state = self::STATE_READY;
            $item->save();
            $this->shipping_items()->add($item);
        }
        $this->order->addShipmentAdjustement();
    }

    protected function updateShipments()
    {
        dd(dump($this));
    }

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

    public function calculateShipment()
    {
        $method = ShippingMethod::find($this->shipping_method->id);
        if($method->calculator == 'flat_rate'){
            return $method->amount;
        }elseif($method == 'per_unit_rate'){
            return $method->amount * $this->order_items->count();
        }
    }

    protected function getMethods($order)
    {
        $products = self::getProductables($order);
        if(count($products) > 0){
            $methods = ShippingMethod::whereIn('shipping_category_id', $products)->lists('name', 'id');
            return $methods;
        }else{
            return ['' => '-- Tienes que añadir elementos al pedido --'];
        }
    }

    protected function getProductables($order)
    {
        $products = array();
        if($order->order_items->count() > 0){
            foreach($order->order_items as $order_item)
            {
                $item = $order_item->productable;
                if($order_item->productable_type == 'Istheweb\Shop\Models\Variant'){
                    $product = $item->product;
                }else{
                    $product = $item;
                }
                array_push($products, $product->id);
            }
        }
        return $products;
    }
}
