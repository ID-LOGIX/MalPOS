<?php

namespace App\Http\Controllers;

use App\Models\TdSaleOrder;
use Illuminate\Http\Request;
use App\Models\TdSaleOrderItem;
use App\Models\TdPaymentDetail;



class TdSaleOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */

     public function check_order_receipt($id){
        $data =  TdSaleOrder::with('td_sale_order_item.md_product')->where('td_sale_order_id', $id)->get();
        return response()->json($data);


     }

     public function receipt($filter  = null)
     {
         //
         if($filter != null){
            $status =TdSaleOrder::where('status', $filter)->get();
            $payment_type =TdSaleOrder::where('payment_type', $filter)->get();
            $order_type =TdSaleOrder::where('order_type', $filter)->get();
            if($status != '[]'){
             $data = $status;
             return response()->json($data);
            }
            if($payment_type != '[]'){
                $data = $payment_type;
                return response()->json($data);

            }
            if($order_type != '[]'){
                $data = $order_type;
                return response()->json($data);

            }

         }
         else{
            $data =  TdSaleOrder::with('td_payment_detail')->get();
            return response()->json($data);

         }


     }




    public function store(Request $request)
{

    $currentTimestamp = time();
    $currentDateTime = date('Y-m-d H:i:s', $currentTimestamp);
    $data = new TdSaleOrder();
    $data->customer = 'Admin';
    $data->status = $request->status;
    $data->src = 'null';
    $data->order_type = $request->order_type;
    $data->payment_type = $request->payment_type;
    $data->order_amount = $request->order_amount;
    $data->cancel_reason = $request->cancel_reason;
    $data->cancel_comment = $request->cancel_comment;
    $data->time = $currentDateTime;
    $data->user_id = '1';
    $data->discount = $request->discount;
    $data->td_sale_order_code = $data->TdSaleOrderCode();
    $data->cd_client_id = '1';
    $data->cd_brand_id = '1';
    $data->cd_branch_id = '1';
    $data->is_active = '1';
    $data->created_by = '1';
    $data->updated_by = '1';
    $data->save();

    $latestOrderId = TdSaleOrder::latest('td_sale_order_id')->pluck('td_sale_order_id')->first();
    $orderId = $latestOrderId;

    $orderDetails['td_sale_order_id'] = $orderId;

    foreach ($request->products as $product) {
        $orderDetails = new TdSaleOrderItem();

        $orderDetails->md_product_id = $product['md_product_id'];
        $orderDetails->qty = $product['qty'];
        $orderDetails->price = $product['price'];
        $orderDetails->cd_client_id = '1';
        $orderDetails->cd_brand_id = '1';
        $orderDetails->cd_branch_id = '1';
        $orderDetails->is_active = '1';
        $orderDetails->created_by = '1';
        $orderDetails->updated_by = '1';
        $orderDetails->td_sale_order_id = $latestOrderId;
        $orderDetails->save();
    }

    if ($request->has('paidAmount') && is_array($request->paidAmount)) {
        foreach ($request->paidAmount as $item) {
            $paymentDetails = new TdPaymentDetail();

            $paymentDetails->tender_type = $item['tender_type'];
            $paymentDetails->payment_amount = $item['payment_amount'];
            $paymentDetails->cd_client_id = '1';
            $paymentDetails->cd_brand_id = '1';
            $paymentDetails->cd_branch_id = '1';
            $paymentDetails->is_active = '1';
            $paymentDetails->created_by = '1';
            $paymentDetails->updated_by = '1';
            $paymentDetails->td_sale_order_id = $latestOrderId;
            $paymentDetails->save();
        }
    }
       $order = TdSaleOrder::with('td_sale_order_item','td_payment_detail')->where('td_sale_order_id',$latestOrderId)->get();
    return response()->json(['order'=>$order]);
}




    /**
     * Display the specified resource.
     */
    public function show(TdSaleOrder $tdSaleOrder)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit( $id)
    {
        //
        $data =  TdSaleOrder::find($id);
            return response()->json($data);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $orderId)
    {

        $currentTimestamp = time();
        $currentDateTime = date('Y-m-d H:i:s', $currentTimestamp);
        $data = TdSaleOrder::findOrFail($orderId);
        $data->customer = 'Admin';
        $data->status = 'paid';
        $data->src = 'null';
        $data->time = $currentDateTime;
        $data->order_type = $request->order_type;
        $data->payment_type = $request->payment_type;
        $data->order_amount = $request->order_amount;
        $data->cancel_reason = $request->cancel_reason;
        $data->cancel_comment = $request->cancel_comment;
        $data->user_id = '1';
        $data->discount = $request->discount;
        $data->cd_client_id = '1';
        $data->cd_brand_id = '1';
        $data->cd_branch_id = '1';
        $data->is_active = '1';
        $data->created_by = '1';
        $data->updated_by = '1';
        $data->save();

        // Update order details
        TdSaleOrderItem::where('td_sale_order_id', $orderId)->delete();
        foreach ($request->products as $product) {
            $orderDetails = new TdSaleOrderItem();
            $orderDetails->md_product_id = $product['md_product_id'];
            $orderDetails->qty = $product['qty'];
            $orderDetails->price = $product['price'];
            $orderDetails->cd_client_id = '1';
            $orderDetails->cd_brand_id = '1';
            $orderDetails->cd_branch_id = '1';
            $orderDetails->is_active = '1';
            $orderDetails->created_by = '1';
            $orderDetails->updated_by = '1';
            $orderDetails->td_sale_order_id = $orderId;
            $orderDetails->save();
        }

        TdPaymentDetail::where('td_sale_order_id', $orderId)->delete();

    foreach ($request->paidAmount as $item) {
        $paymentDetails = new TdPaymentDetail();

        $paymentDetails->tender_type = $item['tender_type'];
        $paymentDetails->payment_amount = $item['payment_amount'];
        $paymentDetails->cd_client_id = '1';
        $paymentDetails->cd_brand_id = '1';
        $paymentDetails->cd_branch_id = '1';
        $paymentDetails->is_active = '1';
        $paymentDetails->created_by = '1';
        $paymentDetails->updated_by = '1';
        $paymentDetails->td_sale_order_id = $orderId;
        $paymentDetails->save();
    }

        return response()->json($data);
    }

    public function checkout(Request $request, $orderId){

        $data = TdSaleOrder::findOrFail($orderId);
        $data->customer = 'Admin';
        $data->status = $request->status;
        $data->src = 'null';
        $data->order_type = $request->order_type;
        $data->payment_type = $request->payment_type;
        $data->order_amount = $request->order_amount;
        $data->cancel_reason = $request->cancel_reason;
        $data->cancel_comment = $request->cancel_comment;
        $data->card_no = $request->card_no;
        $data->card_holder_name = $request->card_holder_name;
        $data->user_id = '1';
        $data->discount = $request->discount;
        $data->cd_client_id = '1';
        $data->cd_brand_id = '1';
        $data->cd_branch_id = '1';
        $data->is_active = '1';
        $data->created_by = '1';
        $data->updated_by = '1';
        $data->save();
        if ($request->has('paidAmount') && is_array($request->paidAmount)) {
            foreach ($request->paidAmount as $item) {
                $paymentDetails = new TdPaymentDetail();

                $paymentDetails->tender_type = $item['tender_type'];
                $paymentDetails->payment_amount = $item['payment_amount'];
                $paymentDetails->cd_client_id = '1';
                $paymentDetails->cd_brand_id = '1';
                $paymentDetails->cd_branch_id = '1';
                $paymentDetails->is_active = '1';
                $paymentDetails->created_by = '1';
                $paymentDetails->updated_by = '1';
                $paymentDetails->td_sale_order_id = $orderId;
                $paymentDetails->save();
            }
        }

    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($orderId)
    {
        $order = TdSaleOrder::findOrFail($orderId);

        // Delete order details
        TdSaleOrderItem::where('order_id', $orderId)->delete();

        // Delete the order
        $order->delete();

        return response()->json(['message' => 'Order deleted successfully']);
    }
}
