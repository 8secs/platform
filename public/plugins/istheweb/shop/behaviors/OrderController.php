<?php
/**
 * Created by PhpStorm.
 * User: andres
 * Date: 1/02/17
 * Time: 13:37
 */

namespace istheweb\shop\behaviors;

use Flash;
use Redirect;
use Istheweb\Shop\Models\Order;

class OrderController extends BaseController
{
    /**
     *
     */
    protected function deleteChecked()
    {
        foreach (post('checked') as $issueId) {
            if ( ! $issue = Order::find($issueId)) {
                continue;
            }
            $issue->delete();
        }

        Flash::success(trans('istheweb.shop::lang.order.delete_selected_success'));
    }

    /**
     * @return string
     */
    protected function getEmptyCheckMessage()
    {
        return trans('istheweb.shop::lang.order.delete_selected_empty');
    }

    public function onRelationManageCreate()
    {
        /*
        $relation_field = post('_relation_field');
        if($relation_field == 'order_items' || $relation_field == 'shipment'){
            return Redirect::refresh();
        }
        */

    }

    public function onRelationManageUpdate(){
        /*
        $relation_field = post('_relation_field');
        if($relation_field == 'order_items' || $relation_field == 'shipment'){
            return Redirect::refresh();
        }
        */
    }

}