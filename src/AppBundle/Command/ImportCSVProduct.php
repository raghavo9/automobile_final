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
        $object = DataObject\Category::getByCategoryName('van');   // this object will be passed to the productCategory Relation
        //p_r($object);

        $dataFileName = $input->getOptions()["file"];
        $filepath = (PIMCORE_PROJECT_ROOT .'/'.$dataFileName);
        
        $myFile = file_get_contents($filepath);



        $decoder = new Serializer([new ObjectNormalizer()],[new CsvEncoder()]);

        $rows = $decoder->decode(file_get_contents($filepath),'csv');


        //p_r("showing rows",$rows);

        $cdate=date_create()->format('d-m-Y');
        $ndate = new DateTime($cdate);   // for createdAt and updatedAt

        //$r0 = $rows[0];
        //$marr = $r0['imgArr'];
        //p_r($marr);
        //
        //$mimgarr = explode(',',$marr);
        //
        //p_r($mimgarr);

        
        foreach($rows as $row)
        {
            $obj = new \Pimcore\Model\DataObject\Product();
            $mkey=$row['key'];
            $mparentID=$row['parentID'];
            $mpublished= $row['published'];
            $mproductSKU =$row['productSKU'];
            $mproductName= $row['productName'];
            $mproductDescription =$row['productDescription'];
            $misproductActive =$row['isproductActive'];
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


            

            // variables for ObjectBricks

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

            // icode for json file
            
            //$mimgCode = $row['imgCode'];
            

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
                $combustionTruck->setMileage(new DataObject\Data\QuantityValue($mDBMaxLoadCapacity, $mDBMaxLoadCapacityUnit_obj->getId()));

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
                $electricTruck->setMileage(new DataObject\Data\QuantityValue($mDBMaxLoadCapacity, $mDBMaxLoadCapacityUnit_obj->getId()));

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

            // FOR FIELD COLLECTION

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



            // saving object 
            $obj->save();
        }



    }
}