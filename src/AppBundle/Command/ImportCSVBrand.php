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


class ImportCSVBrand extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('import:csv_brand')
            ->setDescription('command to import data for brand class from csv file')
            ->addOption("file","f", InputOption::VALUE_REQUIRED,"Pass file path"); 

    }


    protected function execute(InputInterface $input, OutputInterface $output)
    {

        $dataFileName = $input->getOptions()["file"];
        $filepath = (PIMCORE_PROJECT_ROOT .'/'.$dataFileName);
        
        $myFile = file_get_contents($filepath);
        


        $decoder = new Serializer([new ObjectNormalizer()],[new CsvEncoder()]);

        $rows = $decoder->decode(file_get_contents($filepath),'csv');


        
        $cdate=date_create()->format('d-m-Y');
        $ndate = new DateTime($cdate);


       
        
        foreach($rows as $row)
        {
            

            $obj = new \Pimcore\Model\DataObject\Brand();
            $mkey=$row['key'];
            
            $mparentID=$row['parentID'];
            $mpublished= $row['published'];
            $mbrandName= $row['brandName'];
            $mbrandDescription =$row['brandDescription'];
            $misbrandActive =$row['isBrandActive'];
            $mbrandlogo= $row['brandLogo'];
            $mbrandCreatedAt=$ndate;
            $mbrandUpdateAt=$ndate;

            $my_image_path = "/brandLogo/".$mbrandlogo;
            
            $mimage = \Pimcore\Model\Asset::getByPath($my_image_path);     

            
            

            $obj->setKey($mkey);
            $obj->setParentId($mparentID);
            $obj->setBrandName($mbrandName);
            $obj->setBrandDescription($mbrandDescription);
            $obj->setIsBrandActive($misbrandActive);
            $obj->setBrandCreatedAt($mbrandCreatedAt);
            $obj->setBrandUpdatedAt($mbrandUpdateAt);
            $obj->setPublished($mpublished);
            $obj->setBrandLogo($mimage);
            $obj->save();
            
        }



}
}