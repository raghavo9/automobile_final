<?php

namespace AppBundle\Command;

use DateTime;
use Pimcore\Mail;
use Pimcore\Console\AbstractCommand;
use Pimcore\Console\Dumper;
use Pimcore\Model\Asset\MetaData\ClassDefinition\Data\Data;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Pimcore\Model\DataObject;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Serializer\Encoder\CsvEncoder;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Pimcore\Model\Notification\Service\NotificationService;
use Pimcore\Tool\Admin;

class ImportCSVProduct extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('import:csv_product')
            ->setDescription('command to import data for product class from csv file')
            ->addOption("file","f", InputOption::VALUE_REQUIRED,"Pass file path");
            //->addArgument('jsonFileName',InputArgument::REQUIRED,"Name of the json file for images");
             

    }


    protected function execute(InputInterface $input, OutputInterface $output)
    {
       // $object = DataObject\Category::getByCategoryName('van');   // this object will be passed to the productCategory Relation
        //p_r($object);

        //##########################################//
        // for creating LOG file 

        $name="productImportLogs";
        //$logg= \Pimcore\Log\Simple::log($name,"\n\n");
        $errorCount = 0;
        $errorMessage = "";

        $user=new \Pimcore\Model\Notification\Service\UserService();
        $notificationService=new \Pimcore\Model\Notification\Service\NotificationService($user);

        //#########################################//

        $dataFileName = $input->getOptions()["file"];
        $filepath = (PIMCORE_PROJECT_ROOT .'/'.$dataFileName);
        //p_r("something",$dataFileName);//findme
        //p_r(substr($dataFileName,-4));//findme
        if(substr($dataFileName,-4)!=".csv")
        {
            p_r("somthing1");
            //p_r("something1");//findme
            p_r("this file format is not accepted ! ABORTING.......");
            //findme //$userID = $user->getID();
            
            //$currentUser = \Pimcore\Tool\Admin::getCurrentUser();
            
            //$currentUser = Admin::getCurrentUser();
            //if ($currentUser == null) {
            // $currentUser = \Pimcore\Tool\Session::getReadonly()->get("user");
            //}
            //p_r("something",$currentUser);
            //$user = Admin::getCurrentUser();
            //if ($user == null){
            // $user = \Pimcore\Tool\Session::getReadonly()->get("user");
            //}


            $notificationService->sendToUser(2,0, 'ERROR','INVALID file type used for importing data ');
            $logg= \Pimcore\Log\Simple::log($name,"STATUS : Failed to Import , REASON : INVALID file type");
        }
        else
        {
            //p_r("something2");//findme
            $myFile = file_get_contents($filepath);



            $decoder = new Serializer([new ObjectNormalizer()],[new CsvEncoder()]);

            $rows = $decoder->decode(file_get_contents($filepath),'csv');

            if($rows==NULL)
            {
                //p_r("something3 Null file");//findme 
                p_r("file is EMPTY ! ABORTING.......");
                $notificationService->sendToUser(2,0, 'ERROR','file is EMPTY');
                $logg= \Pimcore\Log\Simple::log($name,"STATUS : Failed to Import , REASON : file is EMPTY");
            }
            else
            {


            
                //p_r("showing rows",$rows); //findme

                $cdate=date_create()->format('d-m-Y');
                $ndate = new DateTime($cdate);   // for createdAt and updatedAt

                //$r0 = $rows[0];
                //$marr = $r0['imgArr'];
                //p_r($marr);
                //
                //$mimgarr = explode(',',$marr);
                //
                //p_r($mimgarr);

                $rowNumber =0;
                foreach($rows as $row)
                {
                    
                    //p_r("inside for loop assigning values"); //findme
                    $mkey=$row['key'];
                    $mparentID=$row['parentID'];
                    $mpublished= $row['published'];
                    $mproductSKU =$row['productSKU'];
                    $mproductName= $row['productName'];
                    $mproductDescription =$row['productDescription'];
                    $misproductActive =$row['isProductActive'];
                    $mproductCreatedAt=$ndate;
                    $mproductUpdateAt=$ndate;
                    $mproductBrand=$row['productBrand'];
                    $mproductCategory = $row['productCategory'];
                    $mproductPrice = $row['productPrice'];
                    $mproductPriceUnit = $row['productPriceUnit'];
                    $mproductColour = $row['productColour'];
                    $mproductLaunchDate = new DateTime($row['productLaunchDate']);
                    $mairbagCount = $row['airbagCount'];
                    $mproductEngine =$row['productEngine'];
                    $mproductLength = $row['productLength'];
                    $mproudctLengthUnit =$row['proudctLengthUnit'];
                    $mproudctLengthUnit =$row['proudctLengthUnit'];
                    $mimgArr = $row['imgArr'];
                    $mDBName = $row['DBName'];
                    $mDBMileage = $row['DBMileage'];
                    $mDBMileageUnit = $row['DBMileageUnit'];
                    $mDBMaxLoadCapacity = $row['DBMaxLoadCapacity'];
                    $mDBMaxLoadCapacityUnit = $row['DBMaxLoadCapacityUnit'];
                    $mDBWheelCount = $row['DBWheelCount'];
                    $mDBBatteryCapacity = $row['DBBatteryCapacity'];
                    $mDBBatteryCapacityUnit = $row['DBBatteryCapacityUnit'];
                    $mDBSunroof = $row['DBSunroof'];
                    $mDBFuelType = $row['DBFuelType'];

                    //p_r("showing value mkey ",$misproductActive); //findme
                    if(empty($mkey))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."key not found  in row ".$rowNumber."\n";
                        //p_r($errorMessage);//findme 
                    }
                    if(empty($mparentID))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."parentID not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mpublished))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."published status not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductSKU))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."productSKU not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductName))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product name not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductDescription))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product description not found  in row ".$rowNumber."\n";
                    }
                    if(empty($misproductActive))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."isproductActive not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductBrand))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product brand not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductCategory))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product Category not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductPrice))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product price not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductPriceUnit))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product price unit not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductColour))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product colour not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductLaunchDate))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product launch date not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mairbagCount))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."airbag count not found  in row ".$rowNumber."\n";
                    }
                    
                    if(empty($mproductEngine))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product engine not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproductLength))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."product length not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mproudctLengthUnit))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."proudct length unit not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mimgArr))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."images not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mDBMileage))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."Data Brick Mileage not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mDBMileageUnit))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."Data Brick Mileage Unit not found  in row ".$rowNumber."\n";
                    }
                    if(empty($mDBName))
                    {
                        $errorCount+=1;
                        $errorMessage=$errorMessage."Data Brick Name not found  in row ".$rowNumber."\n";
                    }




                    // variables for ObjectBricks
                    
                    
                    if($mDBName == "CombustionTruck")
                    {
                        
                        if(empty($mDBFuelType))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick FuelType not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBMaxLoadCapacity))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Max Load Capacity not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBMaxLoadCapacityUnit))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Max Load Capacity Unit not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBWheelCount))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Wheel Count not found  in row ".$rowNumber."\n";
                        }
                    }
                    if($mDBName == "CombustionCar")
                    {
                        if(empty($mDBSunroof))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Sunroof not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBFuelType))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick FueLType not found  in row ".$rowNumber."\n";
                        }
                        
                    }
                    if($mDBName == "ElectricCar")
                    {
                        if(empty($mDBSunroof))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Sunroof not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBBatteryCapacity))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Batter Capacity not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBBatteryCapacityUnit))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Battery Capacity Unit not found  in row ".$rowNumber."\n";
                        }
                    }
                    if($mDBName == "ElectricTruck")
                    {
                        if(empty($mDBMaxLoadCapacity))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Max Load Capacity not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBMaxLoadCapacityUnit))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Max Load Capacity Unit not found  in row ".$rowNumber."\n";
                        }
                        if(empty($mDBWheelCount))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage."Data Brick Wheel Count not found  in row ".$rowNumber."\n";
                        }
                    }


                    // parsing string for field collection
                    $imageArray = explode(',',$mimgArr);
                    $imgCount = count($imageArray);
                    $productImages_obj = new DataObject\Fieldcollection();
                    //p_r($imageArray);
                    foreach($imageArray as $img)
                    {
                        $prodImg = new DataObject\Fieldcollection\Data\ProductImages();
                        $imgPath = "/productImages/".$img;
                        $mimage = \Pimcore\Model\Asset::getByPath($imgPath);
                        //p_r($mimage);
                        if(empty($mimage))
                        {
                            $errorCount+=1;
                            $errorMessage=$errorMessage.$img."of row".$rowNumber." not found in assets folder \n";
                        }
                        //$prodImg->setProductImage($mimage);
                        //$productImages_obj->add($prodImg);
                    }
                    //$obj->setProductImages($productImages_obj);
                    // icode for json file
                    //$mimgCode = $row['imgCode'];   
                    $rowNumber+=1;
                    
                }
                if($errorCount>0)
                {
                    p_r("missing values in row  , reffer to loggs for missing fields ! ABORTING.......");
                    $notificationService->sendToUser(2,0, 'ERROR','file not imported !! some missing values . Check log file');
                    $logg= \Pimcore\Log\Simple::log($name,"STATUS:  FAILED to Import  , REASON :\n".$errorMessage);
                    $mail = new \Pimcore\Mail();
                    $mail->addTo('wanderlust.we.009@gmail.com');           //admin 
                    $mail->setSubject('Data Import Failed');
                    $mail->setDocument('/emailFail');
                     // $mail->setParams($params);
                    $mail->send();
                }
                else
                {
                    // running foreach loop again to save data 


                    foreach($rows as $row)
                    {
                        $obj = new \Pimcore\Model\DataObject\Product();
                        $mkey=$row['key'];
                        $mparentID=$row['parentID'];
                        $mpublished= $row['published'];
                        $mproductSKU =$row['productSKU'];
                        $mproductName= $row['productName'];
                        $mproductDescription =$row['productDescription'];
                        $misproductActive =$row['isProductActive'];
                        $mproductCreatedAt=$ndate;
                        $mproductUpdateAt=$ndate;
                        $mproductBrand=$row['productBrand'];
                        $mproductCategory = $row['productCategory'];
                        $mproductPrice = $row['productPrice'];
                        $mproductPriceUnit = $row['productPriceUnit'];
                        $mproductColour = $row['productColour'];
                        $mproductLaunchDate = new DateTime($row['productLaunchDate']);
                        $mairbagCount = $row['airbagCount'];
                        $mproductEngine =$row['productEngine'];
                        $mproductLength = $row['productLength'];
                        $mproudctLengthUnit =$row['proudctLengthUnit'];
                        $mproudctLengthUnit =$row['proudctLengthUnit'];
                        $mimgArr = $row['imgArr'];
                        $mDBName = $row['DBName'];
                        $mDBMileage = $row['DBMileage'];
                        $mDBMileageUnit = $row['DBMileageUnit'];
                        $mDBMaxLoadCapacity = $row['DBMaxLoadCapacity'];
                        $mDBMaxLoadCapacityUnit = $row['DBMaxLoadCapacityUnit'];
                        $mDBWheelCount = $row['DBWheelCount'];
                        $mDBBatteryCapacity = $row['DBBatteryCapacity'];
                        $mDBBatteryCapacityUnit = $row['DBBatteryCapacityUnit'];
                        $mDBSunroof = $row['DBSunroof'];
                        $mDBFuelType = $row['DBFuelType'];

                        $obj->setKey($mkey);
                        $obj->setParentId($mparentID);
                        $obj->setProductSKU($mproductSKU);
                        $obj->setproductName($mproductName);
                        $obj->setProductDescription($mproductDescription);
                        $obj->setIsProductActive($misproductActive);
                        $obj->setProductCreatedAt($mproductCreatedAt);
                        $obj->setproductUpdatedAt($mproductUpdateAt);
                        $obj->setPublished($mpublished);
                        $obj->setProductBrand($mproductBrand);
                        $obj->setProductColour($mproductColour);
                        $obj->setAirbagCount($mairbagCount);
                        $obj->setProductEngine($mproductEngine);
                        $obj->setProductLaunchDate($mproductLaunchDate);

                        // setting values for quantity type data

                        //$unit_sign = DataObject\QuantityValue\Unit::getByAbbreviation($unit);
                        //$obj->setSimpleQuantity(new DataObject\Data\QuantityValue($quant_val, $unit_sign->getId()));

                        $mproductPriceUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mproductPriceUnit);
                        $obj->setProductPrice(new DataObject\Data\QuantityValue($mproductPrice, $mproductPriceUnit_obj->getId()));

                        $mproudctLengthUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mproudctLengthUnit);
                        $obj->setProductLength(new DataObject\Data\QuantityValue($mproductLength, $mproudctLengthUnit_obj->getId()));

                        // settting values of relation type data

                        // this object is of type category to be feeded in relation type data
                        //##1//$mproductCategory_obj = DataObject\Category::getByCategoryName($mproductCategory);
                        //##1//$obj->setProductCategory($mproductCategory_obj);

                        //$object->setMyManyToOneField(Document::getById(23));
                        //--2//$temp = DataObject\Category::getByCategoryName($mproductCategory);
                        //--2//$mcategoryID =$temp->getId();
                        $mcatpath="/Category/".$mproductCategory;
                        $obj->setProductCategory(DataObject::getByPath($mcatpath));


                        // setting values for databricks 
                        if($mDBName == "CombustionTruck")
                        {
                            $combustionTruck = new DataObject\Objectbrick\Data\CombustionTruck($obj);

                            $mDBMileageUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mDBMileageUnit);
                            $combustionTruck->setMileage(new DataObject\Data\QuantityValue($mDBMileage, $mDBMileageUnit_obj->getId()));

                            $combustionTruck->setFuelType($mDBFuelType);

                            $mDBMaxLoadCapacityUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mDBMaxLoadCapacityUnit);
                            $combustionTruck->setMaxLoadCapacity(new DataObject\Data\QuantityValue($mDBMaxLoadCapacity, $mDBMaxLoadCapacityUnit_obj->getId()));

                            $combustionTruck->setWheelCount($mDBWheelCount);

                            // setting objectBrick object

                            $obj->getProductType()->setCombustionTruck($combustionTruck);

                            //p_r("inside combTruck");

                        }
                        elseif($mDBName == "CombustionCar")
                        {
                            $combustionCar = new DataObject\Objectbrick\Data\CoumbustionCar($obj);

                            $mDBMileageUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mDBMileageUnit);
                            $combustionCar->setMileage(new DataObject\Data\QuantityValue($mDBMileage, $mDBMileageUnit_obj->getId()));

                            $combustionCar->setSunroof($mDBSunroof);

                            $combustionCar->setFuelType($mDBFuelType);

                            // setting objectBrick object

                            $obj->getProductType()->setCoumbustionCar($combustionCar);
                            //p_r("inside combCar");
                        }
                        elseif($mDBName == "ElectricCar")
                        {
                            $electricCar = new DataObject\Objectbrick\Data\ElectricCar($obj);

                            $mDBBatteryCapacityUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mDBBatteryCapacityUnit);
                            $electricCar->setBatteryCapacity(new DataObject\Data\QuantityValue($mDBBatteryCapacity, $mDBBatteryCapacityUnit_obj->getId()));

                            $mDBMileageUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mDBMileageUnit);
                            $electricCar->setMileage(new DataObject\Data\QuantityValue($mDBMileage, $mDBMileageUnit_obj->getId()));

                            $electricCar->setSunroof($mDBSunroof);

                            // setting objectBrick object

                            $obj->getProductType()->setElectricCar($electricCar);

                            //p_r("inside elecCar");
                        }
                        elseif($mDBName == "ElectricTruck")
                        {
                            $electricTruck = new DataObject\Objectbrick\Data\ElectricTruck($obj);

                            $mDBMileageUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mDBMileageUnit);
                            $electricTruck->setMileage(new DataObject\Data\QuantityValue($mDBMileage, $mDBMileageUnit_obj->getId()));

                            $mDBMaxLoadCapacityUnit_obj = DataObject\QuantityValue\Unit::getByAbbreviation($mDBMaxLoadCapacityUnit);
                            $electricTruck->setMaxLoadCapacity(new DataObject\Data\QuantityValue($mDBMaxLoadCapacity, $mDBMaxLoadCapacityUnit_obj->getId()));

                            $electricTruck->setWheelCount($mDBWheelCount);

                            // setting objectBrick object

                            $obj->getProductType()->setElectricTruck($electricTruck);
                            //p_r("inside elecTruck");
                        }

                        /*

                        //$jsonFileName = $input->getArgument('jsonFileName');
                        //$jsonFilePath = (PIMCORE_PROJECT_ROOT.'/'.$jsonFileName);

                        //$myJsonFile = file_get_contents($jsonFilePath);

                        //$decoderJSON = new Serializer([new ObjectNormalizer()],[new JsonEncoder()]);
                        //$json_rows = $decoderJSON->decode(file_get_contents($jsonFilePath),'json');

                        //foreach($json_rows as $jrow)
                        //{
                        //    $icode = $jrow['icode'];
                        //    $icount = $jrow['icount'];
                        //    $iarray =$jrow['iarray'];
                        //
                        //    //p_r("icode is ".$icode);
                        //    //p_r("i count is", $icount+1);
                        //    foreach($iarray as $arr)
                        //    {
                        //        //p_r("value is ",$arr);
                        //    }

                        //}

                        */

                        // saving object 
                       

                        //saving field collection data 

                        $imageArray = explode(',',$mimgArr);
                        $imgCount = count($imageArray);
                        $productImages_obj = new DataObject\Fieldcollection();
                        //p_r($imageArray);
                        foreach($imageArray as $img)
                        {
                            

                            $prodImg = new DataObject\Fieldcollection\Data\ProductImages();
                            $imgPath = "/productImages/".$img;
                            $mimage = \Pimcore\Model\Asset::getByPath($imgPath);
                            //p_r($mimage);
                            
                            $prodImg->setProductImage($mimage);
                            $productImages_obj->add($prodImg);
                        }
                        $obj->setProductImages($productImages_obj);

                        $obj->save();
                    }

                    
                    $mail = new \Pimcore\Mail();
                    $mail->addTo('wanderlust.we.009@gmail.com');           //admin 
                    $mail->setSubject('Data Imported successfully');
                    $mail->setDocument('/emailSuccess');
                     // $mail->setParams($params);
                    $mail->send();

                    p_r("Imported Data SUCESSFULLY");
                    $notificationService->sendToUser(2,0, 'SUCCESS','Data imorted sucessfully');
                    $logg= \Pimcore\Log\Simple::log($name,"STATUS : SUCCESS  , Imported Data Sucessfully");

                }
            }

        }

    }

}