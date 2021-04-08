<?php

namespace AppBundle\EventListener;

use Pimcore\Event\Model\DataObjectEvent;
use Pimcore\Event\Model\ElementEventInterface;
use Pimcore\Model\DataObject\Product;
use Pimcore\Event\Model\AssetEvent;
use Pimcore\Event\Model\DocumentEvent;
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
                throw new \Pimcore\Model\Element\ValidationException("Price can not be negative");
                //throw new \Pimcore\Model\Element\ValidationException("This is your custom error message", 1234);
                //$response = new Response();
                //$response->setContent("some message coming from listener");
                //$event->setResponse($response);
            }

        }
        
    }
}