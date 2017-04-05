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
    public function beforeSave()
    {

    }

    /**
     *
     */
    public function afterCreate()
    {
        self::createShipmentItems();
    }

    /**
     *
     */
    public function afterUpdate()
    {
        self::updateShipmentItems();
    }

    /**
     *
     */
    protected function createShipmentItems()
    {
        $products = self::getProductables($this->order);
        foreach($products as $id){
            self::addShippingItem($id);
        }
        $this->order->addShipmentAdjustement();
    }

    /**
     *
     */
    protected function updateShipmentItems()
    {
        $products = self::getProductables($this->order);
        if(!$this->shipping_items->isEmpty()){
            foreach($products as $id){
                if(!$this->shipping_items->contains('shippable_id', $id)){
                    self::addShippingItem($id);
                }
            }
        }
        $this->order->updateShipmentAdjustment();
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
     * @return mixed
     */
    public function calculateShipment()
    {
        if($this->shipping_method->calculator == 'flat_rate'){
            return $this->shipping_method->amount;
        }elseif($this->shipping_method == 'per_unit_rate'){
            return $this->shipping_method->amount * $this->shipping_items->count();
        }
    }

    /**
     * @param $order
     * @return array
     */
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

    /**
     * @param $order
     * @return array
     */
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

    /**
     * @param $id
     */
    protected function addShippingItem($id)
    {
        $item = new ShipmentItem();
        $item->shipment = $this;
        $item->shippable = Product::find($id);
        $item->state = self::STATE_READY;
        $item->save();
        $this->shipping_items()->add($item);
    }
}
