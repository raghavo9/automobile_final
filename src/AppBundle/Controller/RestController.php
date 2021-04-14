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
class RestController extends Pimcore\Bundle\AdminBundle\Controller\Rest\AbstractRestController
{

    /**
     * @Route("/webservice/addcategory", methods={"PUT"})
     */
    public function addCategory(Request $request)
    {

        $data = json_decode($request->getContent(), true);

        //dump($data);
        $cdate=date_create()->format('d-m-Y');
        $ndate = new DateTime($cdate);
        $rowNumber =0;
        $errorMessage = "";
        $errorCount=0;
        foreach($data as $row)
        {
            $mkey=$row['key'];
            $mparentID=$row['parentID'];
            $mpublished= $row['published'];
            $mcategoryName= $row['categoryName'];
            $mcategoryDescription =$row['categoryDescription'];
            $misCategoryActive =$row['isCategoryActive'];
            $mcategoryCreatedAt=$ndate;
            $mcategoryUpdateAt=$ndate;


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
            if(empty($mcategoryName))
            {
                $errorCount+=1;
                $errorMessage=$errorMessage."Category Name not found  in row ".$rowNumber."\n";
            }
            if(empty($mcategoryDescription))
            {
                $errorCount+=1;
                $errorMessage=$errorMessage."Category Description not found  in row ".$rowNumber."\n";
            }
            if(empty($misCategoryActive))
            {
                $errorCount+=1;
                $errorMessage=$errorMessage."isCategoryActive not found  in row ".$rowNumber."\n";
            }
            
            $rowNumber+=1;


        }
        if($errorCount>0)
        {
            dump($errorMessage);
            return $this->adminJson(["success" => false]);
        }
        else
        {
            $cdate=date_create()->format('d-m-Y');
            $ndate = new DateTime($cdate);
            foreach($data as $row)
            {
                $obj = new \Pimcore\Model\DataObject\Category();
                $mkey=$row["key"];
                $mparentID=$row["parentID"];
                $mpublished= $row["published"];
                $mcategoryName= $row["categoryName"];
                $mcategoryDescription =$row["categoryDescription"];
                $misCategoryActive =$row["isCategoryActive"];
                $mcategoryCreatedAt=$ndate;
                $mcategoryUpdateAt=$ndate;

                //dump($row["key"]);

                //dump($mkey);
                //dump($mparentID);
                //dump($mpublished);
                //dump($mcategoryName);
                //dump($mcategoryDescription);
                //dump($mcategoryCreatedAt);
                //dump($mcategoryUpdateAt);
                //dump($misCategoryActive);

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
            return $this->adminJson(["success" => true]);
        }
        
        
    }


    /**
     * @Route("/webservice/addbrand", methods={"PUT"})
     */
    public function addBrand(Request $request)
    {
        $this->checkPermission('objects');
        $data = json_decode($request->getContent(), true);
        
        //dump($data);
        $rowNumber =0;
        $errorMessage = "";
        $errorCount=0;
        foreach($data as $row)
        {
            $cdate=date_create()->format('d-m-Y');
            $ndate = new DateTime($cdate);
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
            dump($errorMessage);
            return $this->adminJson(["success" => false]);
        }
        else
        {

            $cdate=date_create()->format('d-m-Y');
            $ndate = new DateTime($cdate);

            foreach($data as $row)
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
        return $this->adminJson(["success" => true]);
        }

    }

    /**
     * @Route("/webservice/addproduct", methods={"PUT"})
     */
    public function addProduct(Request $request)
    {
        $this->checkPermission('objects');
        $data = json_decode($request->getContent(), true);

        //dump($data);
        $errorCount = 0;
        $errorMessage = "";
        $rowNumber =0;

        $cdate=date_create()->format('d-m-Y');
        $ndate = new DateTime($cdate);   // for createdAt and updatedAt
        foreach($data as $row)
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
            dump($errorMessage);
            return $this->adminJson(["success" => false]);

        }
        else
        {
            foreach($data as $row)
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
            return $this->adminJson(["success" => true]);
        }
    }

}