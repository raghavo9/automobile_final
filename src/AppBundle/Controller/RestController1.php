<?php

namespace AppBundle\Controller;

use DateTime;
use Pimcore;
use Pimcore\Bundle\AdminBundle\Controller\Rest\AbstractRestController;
use Pimcore\Model\DataObject;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\component\HttpFoundation\JsonResponse;

/**
 * Class RestController
 * @package AppBundle\Controller
 */

class RestController1 extends Pimcore\Bundle\AdminBundle\Controller\Rest\AbstractRestController
{
    /**
     * @Route("/webservice/brandlist1", methods={"GET"})
     */
    public function getBrand(Request $request)
    {
        $this->checkPermission('objects');
        //Products listing
        $brands = new Pimcore\Model\DataObject\Brand\Listing();
        foreach ($brands as $key => $brand) {
            $data[] = array(
                "brand_name" => $brand->getBrandName(),
                "brand_description" => $brand->getBrandDescription(),
                "brandLogo" => $brand->getBrandLogo()
                //"id" => $brand->getBrandID()
            );
        }

        return $this->adminJson(["success" => true, "data" => $data]);
    }

    /**
     * @Route("/webservice/categorylist", methods={"GET"})
     */
    public function getCategory(Request $request)
    {
        $this->checkPermission('objects');
        //Products listing
        $categories = new Pimcore\Model\DataObject\Category\Listing();
        foreach ($categories as $key => $category) {
            $data[] = array(
                "category_name" => $category->getCategoryName(),
                "category_description" => $category->getCategoryDescription(),
                //"id" => $brand->getBrandID()
            );
        }

        return $this->adminJson(["success" => true, "data" => $data]);
    }

    /**
     * @Route("/webservice/productlist", methods={"GET"})
     */
    public function getProduct(Request $request)
    {
        $this->checkPermission('objects');
        
        //$data = json_decode($request->getContent(), true);
        $price = $request->query->get('price');
        $colour = $request->query->get('colour');
        $limit = $request->query->get('limit');
        //dump($price);
        //dump($colour);
        //dump("something");
        
        //foreach($data as $row)
        //{
        //    $price = $data["price"];
        //    $colour = $data["colour"];
        //}
        
        
        //Products listing
        $products = new Pimcore\Model\DataObject\Product\Listing();
        //setConditionParam("customerType = ?","something","AND" )
        if(!empty($limit))
        {
            $products->setLimit($limit);
        }
        if(!empty($price))
        {
            $products->setCondition("productPrice >= ?",$price,"AND");
        }
        if(!empty($colour))
        {
            $products->setCondition("productColour = ?",$colour);
        }
        foreach ($products as $key => $product) {
            $data[] = array(
                "product_name" => $product->getProductName(),
                "product_description" => $product->getProductDescription(),
                "productPriceUnit" => $product->getProductPrice()->__toString(),
                //"productMileage" => $product->getProductType(),
                //"id" => $brand->getBrandID()
            );
            
        }

        return $this->adminJson(["success" => true, "data" => $data]);
    }
    /**
     * @Route("/webservice/productlistfull", methods={"GET"})
     */
    public function getProductFull(Request $request)
    {
        $this->checkPermission('objects');
        
        
        
        //Products listing
        $products = new Pimcore\Model\DataObject\Product\Listing();
        //setConditionParam("customerType = ?","something","AND" )
        //$pageLimit = 3;

        //if (isset($_GET["page"])) 
        //{
        //    $page  = $_GET["page"];        
        //}    
        //else
        //{
        //    $page = 1;    
        //} 
        //$offset = ($page-1) * $pageLimit; 
        //
        //$total_products = count($products);
        //$products->setLimit($pageLimit);
        //if($offset > 0)
        //{
        //  $products->setOffset($offset);
        //}
        //else
        //{
        //  $products->setOffset(0);
        //}
        if(isset($_GET["offset"]))
        {
            $offset = $_GET["offset"];
        }
        else{
            $offset =0;
        }
        if(isset($_GET["limit"]))
        {
            $pageLimit = $_GET["limit"];
        }
        else{
            $pageLimit =1;
        }
        
        
        if(isset($_GET["name"]))
        {
            $name = $_GET["name"];
            $products->setOrder($name);
            $products->setOrderKey("productName");

        }
        if(isset($_GET["date"]))
        {
            $date = $_GET["date"];
            $products->setOrder($date);
            $products->setOrderKey("productLaunchDate");
        }
        if(isset($_GET["search"]))
        {
            $search = $_GET["search"];
            $temp = $search."%";
            $products->setCondition("lower(productName) LIKE ?",["$temp"]);
        }
        
        $products->setOffset($offset);
        // first set the offset to get total no. of products of that condition and then set limit 



        //if and only if we are viewing product detail of single product
        if(isset($_GET["productSKU"]))
        {
            $product_SKU = $_GET["productSKU"];
            $products->setCondition("productSKU = ?",$product_SKU);
        }
        
        $total_products = count($products);
        $products->setLimit($pageLimit);
        

        

        
        


    
        foreach ($products as $product) {
            $arr = array();
            $arr[0] = $product->getProductType()->getCoumbustionCar();
            $arr[1] = $product->getProductType()->getCombustionTruck();
            $arr[2] = $product->getProductType()->getElectricCar();
            $arr[3] = $product->getProductType()->getElectricTruck();
            $productType = "";
            $ct =0;
            foreach($arr as $i)
            {

                if(!empty($i))
                {
                    $productType = $i->getType();
                    break;
                }
            }
            if($productType =="CoumbustionCar")
            {
                $obrick = $arr[0];
                $product_mileage = $obrick->getmileage()->__toString();
                $product_sunroof = $obrick->getSunroof();
                $product_fuel_type = $obrick->getFuelType();
                $product_max_load_capacity = "NA";
                $product_wheel_count = "NA";
                $product_battery_capacity = "NA";
                //$data_brick = array(
                //    "product_mileage" => $obrick->getmileage()->__toString(),
                //    "product_sunroof" => $obrick->getSunroof(),
                //    "product_fuel_type" => $obrick->getFuelType()
                //);
            }
            if($productType == "CombustionTruck")
            {
                $obrick = $arr[1];
                $product_mileage = $obrick->getmileage()->__toString();
                $product_sunroof = "NA";
                $product_fuel_type = $obrick->getFuelType();
                $product_max_load_capacity = $obrick->getMaxLoadCapacity()->__toString();
                $product_wheel_count = $obrick->getWheelCount();
                $product_battery_capacity = "NA";
                //$data_brick = array(
                //    "product_mileage" => $obrick->getmileage()->__toString(),
                //    "product_max_load_capacity" => $obrick->getMaxLoadCapacity()->__toString(),
                //    "product_fuel_type" => $obrick->getFuelType(),
                //    "product_wheel_count" => $obrick->getWheelCount()
                //);
            }
            if($productType == "ElectricCar")
            {
                $obrick = $arr[2];
                $product_mileage = $obrick->getmileage()->__toString();
                $product_sunroof = $obrick->getSunroof();
                $product_fuel_type = "NA";
                $product_max_load_capacity = "NA";
                $product_wheel_count = "NA";
                $product_battery_capacity = $obrick->getBatteryCapacity()->__toString();
                //$data_brick = array(
                //    "product_mileage" => $obrick->getmileage()->__toString(),
                //    "product_sunroof" => $obrick->getSunroof(),
                //    "product_battery_capacity" => $obrick->getBatteryCapacity()->__toString()
                //);
            }
            if($productType == "ElectricTruck")
            {
                $obrick = $arr[3];
                $product_mileage = $obrick->getmileage()->__toString();
                $product_sunroof = "NA";
                $product_fuel_type = "NA";
                $product_max_load_capacity = $obrick->getMaxLoadCapacity()->__toString();
                $product_wheel_count = $obrick->getWheelCount();
                $product_battery_capacity = "NA";
                //$data_brick = array(
                //    "product_mileage" => $obrick->getmileage()->__toString(),
                //    "product_max_load_capacity" => $obrick->getMaxLoadCapacity()->__toString(),
                //    "product_wheel_count" => $obrick->getWheelCount()
                //);
            }
            $prodcategory = $product->getProductCategory()->__toString();
            $cat_name = explode("/",$prodcategory)[2];
            $proddate = $product->getProductLaunchDate();
            $pdate = substr($proddate,0,9);
            $data[] = array(
                "product_name" => $product->getProductName(),
                "product_description" => $product->getProductDescription(),
                "product_price" => $product->getProductPrice()->__toString(),
                "product_brand" =>$product->getProductBrand(),
                "product_category" =>$cat_name,
                "product_colour" =>$product->getProductColour(),
                "product_launch_date" =>$pdate,
                "product_airbag_count" =>$product->getAirbagCount(),
                "product_engine" =>$product->getProductEngine(),
                "product_length" =>$product->getProductLength()->__toString(),
                "product_type" =>$productType,
                "product_mileage" =>$product_mileage,
                "product_sunroof" =>$product_sunroof,
                "product_fuel_type" =>$product_fuel_type,
                "product_max_load_capacity" =>$product_max_load_capacity,
                "product_wheel_count" => $product_wheel_count,
                "product_battery_capacity" =>$product_battery_capacity,
                "product_SKU" =>$product->getProductSKU()
            );
            //$data_complete = array_merge($data,$data_brick);
            
        }

        return $this->adminJson(["success" => true, "data" => $data, "total_products"=>$total_products,"pageLimit"=>$pageLimit]);
    }

}