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


class checkDataBrick extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('check:product')
            ->setDescription('command to check listing of product');

    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        //p_r("something");
        $product = new \Pimcore\Model\DataObject\Product\Listing();
        $product->setOrder("DESC");
        $product->setOrderKey("productName");
        
        
        
        foreach($product as $prod)
        {
            $arr = array();
            $arr[0] = $prod->getProductType()->getCoumbustionCar();
            $arr[1] = $prod->getProductType()->getCombustionTruck();
            $arr[2] = $prod->getProductType()->getElectricCar();
            $arr[3] = $prod->getProductType()->getElectricTruck();
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
            //p_r($productType);



            if($productType =="CoumbustionCar")
            {
                $obrick = $arr[0];
                $var = $obrick->getmileage()->__toString();
                //p_r($var);
                //$v_arr = explode(" ",$var);
                //p_r($v_arr[0]);
                //p_r($v_arr[1]);
            }
            $name = $prod->getProductName();
            $prodid = $prod->getId();
            $prodprice = $prod->getProductPrice()->__toString();
            $prodbrand = $prod->getProductBrand();
            $prodcategory = $prod->getProductCategory()->__toString();
            $proddate = $prod->getProductLaunchDate();
            $prodcol = $prod->getProductColour();
            
            //$images = $prod->getProductImages()->getproductImages();

            //foreach($images as $x)
            //{
            //    //$x->getfilename();
            //    p_r($x);
            //    
            //}
            //p_r("product name : ".$name);
            //p_r("product_id : ".$prodid);
            //p_r("product price : ".$prodprice);
            //p_r("product brand : ".$prodbrand);
            //p_r("product category : ".explode("/",$prodcategory)[2]);
            //p_r("product launch date : ".substr($proddate,0,9));
//
//            //p_r(explode("/",$prod->getProductCategory()->__toString())[2]);
            //p_r($prodcol);
            //p_r(substr($prod->getProductLaunchDate(),0,9));
            //p_r();
            //p_r();

            break;
        }
        
        //$var = sprintf(
        //    "%s://%s%s",
        //    isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http',
        //    $_SERVER['SERVER_NAME'],
        //    $_SERVER['REQUEST_URI']
        //  );
        //p_r($var);

            $data = new \Pimcore\Model\DataObject\Product\Listing();
            $temp = "a";
            $tp = $temp."%";

            $data->setCondition("lower(productName) LIKE ?", ["$tp"]);
            p_r("helllo");
            if(empty($data))
            {
                p_r("its empty");
            }

            //p_r($data);
            foreach($data as $da)
            {
                p_r("data: : : ");
                p_r($da->getProductName());
            }

            

    }


}