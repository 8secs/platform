<?php namespace Istheweb\Shop\Models;

use Model;

/**
 * ShipmentItem Model
 */
class ShipmentItem extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'istheweb_shop_shipment_items';

    /**
     * @var array Fillable fields
     */
    protected $fillable = ['state'];

    /**
     * @var array Relations
     */
    public $belongsTo = [
        'shipment'  => 'Istheweb\Shop\Models\Shipment'
    ];
    public $belongsToMany = [];
    public $morphTo = [
        'shippable' => []
    ];
}
