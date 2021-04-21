<?php

namespace AppBundle\Command;

use DateTime;
use Pimcore\Mail;
use Pimcore\Console\AbstractCommand;
use Pimcore\Console\Dumper;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Pimcore\Model\DataObject;
use Pimcore\Tool\Session;
use Pimcore\Model\Notification\Service\UserService;

class checkDataNew extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('check:datanew')
            ->setDescription('command to check data by api');

    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        p_r("it is here");
        $products = new \Pimcore\Model\DataObject\Product\Listing();
        //setConditionParam("customerType = ?","something","AND" )

        ///////////////here star///////////////////////////////
        //if(!empty($limit))
        //{
        //    $products->setLimit($limit);
        //}
        //if(!empty($price))
        //{
        //    $products->setCondition("productPrice >= ?",$price,"AND");
        //}
        //if(!empty($colour))
        //{
        //    $products->setCondition("productColour = ?",$colour);
        //}
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
                "product_battery_capacity" =>$product_battery_capacity
            );
            //$data_complete = array_merge($data,$data_brick);
            
        }
            
            p_r($data);
        

        
    }
}