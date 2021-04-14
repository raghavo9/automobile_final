<?php

namespace AppBundle\EventListener;

use DateTime;
use Pimcore\Event\Model\DataObjectEvent;
use Pimcore\Event\Model\ElementEventInterface;
use Pimcore\Model\DataObject\Product;
use Pimcore\Event\Model\AssetEvent;
use Pimcore\Event\Model\DocumentEvent;
use Pimcore\Model\DataObject\Brand;
use Pimcore\Model\DataObject\Category;
use Pimcore\Model\DataObject\Objectbrick\Data\CombustionTruck;
use Pimcore\Model\DataObject\Objectbrick\Data\ElectricCar;
use Pimcore\Model\DataObject\Objectbrick\Data\ElectricTruck;
use Pimcore\Model\Element\ValidationException;
use Symfony\Component\HttpKernel\Event\GetResponseForExceptionEvent;
use Symfony\Component\HttpFoundation\Response;

class airbagListener
{
    //public function onPreUpdate (ElementEventInterface $e , GetResponseForExceptionEvent $event)
    public function onPreUpdate (ElementEventInterface $e)
    {
        if($e->getObject() instanceof Product)
        {
            $obj = $e->getObject();
            //$mdate= $obj->getSampleDate();
            //$today = date("Y-m-d");
            //p_r($today);
            //p_r($mdate);
            //if($mdate>$today)
            //{
            //    p_r("SampleDate cannot be future date ");die;
            //}
            $airbagCount = $obj->getAirbagCount();
            if($airbagCount <= 0)
            {
                throw new \Pimcore\Model\Element\ValidationException("Airbag count can not be negative");
                //throw new \Pimcore\Model\Element\ValidationException("This is your custom error message", 1234);
                //$response = new Response();
                //$response->setContent("some message coming from listener");
                //$event->setResponse($response);
            }

        }
        
    }


    public function updatedAtTime (ElementEventInterface $e)
    {
        if($e->getObject() instanceof Product)
        {
            $cdate=date_create()->format('d-m-Y');
            $ndate = new DateTime($cdate);
            $obj = $e->getObject();
            
            $obj->setProductUpdatedAt($ndate);

        }
        if($e->getObject() instanceof Brand)
        {
            $cdate=date_create()->format('d-m-Y');
            $ndate = new DateTime($cdate);
            $obj = $e->getObject();
            
            $obj->setBrandUpdatedAt($ndate);

        }
        if($e->getObject() instanceof Category)
        {
            $cdate=date_create()->format('d-m-Y');
            $ndate = new DateTime($cdate);
            $obj = $e->getObject();
            
            $obj->setCategoryUpdatedAt($ndate);

        }
        
    }


    

    public function createdAtCheck (ElementEventInterface $e)
    {
        if($e->getObject() instanceof Category)
        {
            $obj = $e->getObject();
            
            $createdValue = $obj->getCategoryCreatedAt();
            $cdate=date_create()->format('d-m-Y');

            if($createdValue > $cdate)
            {
                throw new \Pimcore\Model\Element\ValidationException("created At cannot be greater than present date");
            }
            
        }
        if($e->getObject() instanceof Brand)
        {
            $obj = $e->getObject();
            
            $createdValue = $obj->getBrandCreatedAt();
            $cdate=date_create()->format('d-m-Y');

            if($createdValue > $cdate)
            {
                throw new \Pimcore\Model\Element\ValidationException("created At cannot be greater than present date");
            }
            
        }
        if($e->getObject() instanceof Product)
        {
            $obj = $e->getObject();
            
            $createdValue = $obj->getProductCreatedAt();
            $cdate=date_create()->format('d-m-Y');

            if($createdValue > $cdate)
            {
                throw new \Pimcore\Model\Element\ValidationException("created At cannot be greater than present date");
            }
            
        }
    }


    public function productLengthCheck (ElementEventInterface $e)
    {
        if($e->getObject() instanceof Product)
        {
            $obj = $e->getObject();
            
            $productLength = $obj->getProductLength()->getvalue();
            if($productLength <= 0)
            {
                throw new \Pimcore\Model\Element\ValidationException("Productlength can not be negative");
                
            }
            
        }
        
    }

    public function productPriceCheck (ElementEventInterface $e)
    {
        if($e->getObject() instanceof Product)
        {
            $obj = $e->getObject();
            
            $productPrice = $obj->getProductPrice()->getvalue();
            if($productPrice <= 0)
            {
                throw new \Pimcore\Model\Element\ValidationException("Price can not be negative");
                
            }
            
        }
    }


}