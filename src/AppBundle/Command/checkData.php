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

class checkData extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('check:data')
            ->setDescription('command to check data by api');

    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        p_r("something");
        $api_url = 'http://pim.local/webservice/categorylist';

        // Read JSON file
        //$json_data = file_get_contents($api_url);
        //p_r($json_data);

        $opts = array(
            'http'=>array(
              'method'=>"GET",
              'header'=>"x-api-key:1d4e9a03106f776a929d430bc2b7903c1617b958570499347231fc6d5b127729"
            )
          );
          
          $context = stream_context_create($opts);
          
          // Open the file using the HTTP headers set above
          //$file = file_get_contents('http://pim.local/webservice/categorylist', false, $context);
          //
          ////p_r($file);
          //$json = json_decode($file);
          ////p_r($json);
          //
          ////foreach($json as $row)
          ////{
          ////    //p_r($row);
          ////}
          //
          //$content = $json->data;
          //foreach($content as $row)
          //{
          //    p_r($row->category_name);
          //}

          ///////////////////// FOR PRODUCTS ///////////////////////////////

          //$opts = array(
          //  'http'=>array(
          //    'method'=>"GET",
          //    'header'=>"x-api-key:1d4e9a03106f776a929d430bc2b7903c1617b958570499347231fc6d5b127729"
          //  )
          //);
          //
          //$context = stream_context_create($opts);
          //
          //// Open the file using the HTTP headers set above
          //$file = file_get_contents('http://pim.local/webservice/productlist', false, $context);
          //$json = json_decode($file);
          //$content = $json->data;
          //foreach($content as $row)
          //{
          //    //p_r($row->product_name);
          //    p_r($row);
          //}


          //////////////// FOR COMPLETE PRODUCT////////////////////////////

          $opts = array(
            'http'=>array(
              'method'=>"GET",
              'header'=>"x-api-key:1d4e9a03106f776a929d430bc2b7903c1617b958570499347231fc6d5b127729"
            )
          );
          
          $context = stream_context_create($opts);
          
          // Open the file using the HTTP headers set above
          $file = file_get_contents('http://pim.local/webservice/productlistfull', false, $context);
          $json = json_decode($file);
          $content = $json->data;
          foreach($content as $row)
          {
              //p_r($row->product_name);
              p_r($row->product_name);
              //p_r("/////////////////////////////////\n////////////////////////////\n/////////////////////");
          }



    }
}