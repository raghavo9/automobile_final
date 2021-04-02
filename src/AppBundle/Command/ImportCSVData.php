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
use Symfony\Component\Serializer\Encoder\CsvEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;

class ImportCSVData extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('import:csv_category')
            ->setDescription('command to import data for category class from csv file')
            ->addOption("file","f", InputOption::VALUE_REQUIRED,"Pass file path"); 

    }


    protected function execute(InputInterface $input, OutputInterface $output)
    {
        

        
        
        $dataFileName = $input->getOptions()["file"];
        $filepath = (PIMCORE_PROJECT_ROOT .'/'.$dataFileName);
        
        $myFile = file_get_contents($filepath);



        $decoder = new Serializer([new ObjectNormalizer()],[new CsvEncoder()]);

        $rows = $decoder->decode(file_get_contents($filepath),'csv');


        p_r("showing rows",$rows);
        $cdate=date_create()->format('d-m-Y');
        $ndate = new DateTime($cdate);


       
        
        foreach($rows as $row)
        {
            
            $obj = new \Pimcore\Model\DataObject\Category();
            $mkey=$row['key'];
            $mparentID=$row['parentID'];
            $mpublished= $row['published'];
            $mcategoryName= $row['categoryName'];
            $mcategoryDescription =$row['categoryDescription'];
            $misCategoryActive =$row['isCategoryActive'];
            $mcategoryCreatedAt=$ndate;
            $mcategoryUpdateAt=$ndate;

            $obj->setKey($mkey);
            $obj->setParentId($mparentID);
            $obj->setCategoryName($mcategoryName);
            $obj->setCategoryDescription($mcategoryDescription);
            $obj->setIsCategoryActive($misCategoryActive);
            $obj->setCategoryCreatedAt($mcategoryCreatedAt);
            $obj->setCategoryUpdatedAt($mcategoryUpdateAt);
            $obj->setPublished($mpublished);
            $obj->save();
            
        }

        
    }


}