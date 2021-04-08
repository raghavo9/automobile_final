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

}