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
use Pimcore\Model\Notification\Service\NotificationService;


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


        $name="BandImportLogs";
        //$logg= \Pimcore\Log\Simple::log($name,"\n\n");
        $errorCount = 0;
        $errorMessage = "";

        $user=new \Pimcore\Model\Notification\Service\UserService();
        $notificationService=new \Pimcore\Model\Notification\Service\NotificationService($user);

        $dataFileName = $input->getOptions()["file"];

        if(substr($dataFileName,-4)!=".csv")
        {
            //p_r("something1");//findme
            p_r("this file format is not accepted ! ABORTING.......");
            $notificationService->sendToUser(2,0, 'ERROR','INVALID file type used for importing data ');
            $logg= \Pimcore\Log\Simple::log($name,"STATUS : Failed to Import , REASON : INVALID file type");
        }
        else
        {

            

            $filepath = (PIMCORE_PROJECT_ROOT .'/'.$dataFileName);
            
            $myFile = file_get_contents($filepath);
            


            $decoder = new Serializer([new ObjectNormalizer()],[new CsvEncoder()]);

            $rows = $decoder->decode(file_get_contents($filepath),'csv');

            if($rows==NULL)
            {
                //p_r("something3 Null file");//findme 
                p_r("file is EMPTY ! ABORTING.......");
                $notificationService->sendToUser(2,0, 'ERROR','file is EMPTY');
                $logg= \Pimcore\Log\Simple::log($name,"STATUS : Failed to Import Categories, REASON : file is EMPTY");
            }
            else
            {

                
                
                $cdate=date_create()->format('d-m-Y');
                $ndate = new DateTime($cdate);


                 $rowNumber =0;
                
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

                    if(empty($mkey))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."key not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mparentID))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."ParentID not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mpublished))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."published status not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mbrandName))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."Brand Name not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mbrandDescription))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."Brand Description not found  in row ".$rowNumber."\n";
                    }
                    if(empty($misbrandActive))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."isBrandActive not found  in row ".$rowNumber."\n";
                    }

                    
                    $my_image_path = "/brandLogo/".$mbrandlogo;

                    $mimage = \Pimcore\Model\Asset::getByPath($my_image_path);     

                    if(empty($mimage))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."cannot find brandLogo in Assets for row ".$rowNumber."\n";
                    }

                    $rowNumber+=1;

                }
                if($errorCount>0)
                {
                    p_r("missing values in row  , reffer to brandImport  logs for missing fields ! ABORTING.......");
                    $notificationService->sendToUser(2,0, 'ERROR','file not imported !! some missing values . Check log file');
                    $logg= \Pimcore\Log\Simple::log($name,"STATUS:  FAILED to Import  , REASON :\n".$errorMessage);
                }
                else
                {

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
                    p_r("Imported Data SUCESSFULLY");
                    $notificationService->sendToUser(2,0, 'SUCCESS','Data imorted sucessfully');
                    $logg= \Pimcore\Log\Simple::log($name,"STATUS : SUCCESS  , Imported Data Sucessfully");

                    
                }

                    

                
            }
        }



    }
}