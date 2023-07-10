<?php

namespace App\Http\Controllers;

use App\Models\MdProduct;
use Illuminate\Http\Request;

class MdProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id = null)
    {
     if($id != null){
            $product = MdProduct::where('md_product_category_id', $id)->get();
        }
        else{
            $product = MdProduct::with('client','brand', 'branch')->get();
            // $order_detail = OrderDetail::all();
        }
        return response()->json(['product'=>$product]);
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
    public function store(Request $request)
    {
        $data = new MdProduct();
        $data->product_code = $request->product_code;
        $data->product_name = $request->product_name;
        $data->product_price = $request->product_price;
        $data->md_product_category_id = $request->md_product_category_id;
        $data->cd_client_id = $request->cd_client_id;
        $data->cd_brand_id = $request->cd_brand_id;
        $data->cd_branch_id = $request->cd_branch_id;
        $data->is_active = $request->is_active;
        $data->created_by = $request->created_by;
        $data->updated_by = $request->updated_by;
        if ($image = $request->file('product_image')) {
            $destinationPath = public_path('img/product_image/');
            $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image->move($destinationPath, $profileImage);
            $data->product_image = $profileImage;
        }
        $data->save();
        return response()->json($data);
    }

    /**
     * Display the specified resource.
     */
    public function show(MdProduct $mdProduct)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit( $id)
    {
        //
        $data = MdProduct::find($id);
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        //
        $data =  MdProduct::find($id);
        $data->product_code = $request->product_code;
        $data->product_name = $request->product_name;
        $data->product_price = $request->product_price;
        $data->md_product_category_id = $request->md_product_category_id;
        $data->cd_client_id = $request->cd_client_id;
        $data->cd_brand_id = $request->cd_brand_id;
        $data->cd_branch_id = $request->cd_branch_id;
        $data->is_active = $request->is_active;
        $data->created_by = $request->created_by;
        $data->updated_by = $request->updated_by;
        if ($image = $request->file('product_image')) {
            $destinationPath = public_path('img/product_image/');
            $profileImage = date('YmdHis') . "." . $image->getClientOriginalExtension();
            $image->move($destinationPath, $profileImage);
            $data->product_image = $profileImage;
        }
        $data->save();
        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        //
        $data = MdProduct::find($id);
        $data->delete();
        return response()->json($data);
    }
}
