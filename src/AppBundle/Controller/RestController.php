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
     * @Route("/webservice/categorylist", methods={"GET"})
     */
    public function getBrand(Request $request)
    {
        //$this->checkPermission('objects');
        //Products listing
        $brands = new Pimcore\Model\DataObject\Brand\Listing();
        foreach ($brands as $key => $brand) {
            $data[] = array(
                "brand_name" => $brand->getBrandName(),
                "brand_description" => $brand->getBrandDescription(),
                //"id" => $brand->getBrandID()
            );
        }

        return $this->adminJson(["success" => true, "data" => $data]);
    }

    /**
     * @Route("/webservice/addcategory", methods={"PUT"})
     */
    public function addCategory(Request $request)
    {

        $data = json_decode($request->getContent(), true);

        dump($data);

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

        //$this->checkPermission('objects');
        //Products listing
        //$brands = new Pimcore\Model\DataObject\Brand\Listing();
        //foreach ($brands as $key => $brand) {
        //    $data[] = array(
        //        "brand_name" => $brand->getBrandName(),
        //        "brand_description" => $brand->getBrandDescription(),
        //        //"id" => $brand->getBrandID()
        //    );
        //}

        return $this->adminJson(["success" => true]);
        //return new JsonResponse(['status' => 'product updated!']);
    }

    /**
     * @Route("/webservice/addbrand", methods={"PUT"})
     */
    public function addBrand(Request $request)
    {
        $data = json_decode($request->getContent(), true);
        
        dump($data);
        
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

    /**
     * @Route("/webservice/addproduct", methods={"PUT"})
     */
    public function addProduct(Request $request)
    {
        $data = json_decode($request->getContent(), true);

        dump($data);

        $cdate=date_create()->format('d-m-Y');
        $ndate = new DateTime($cdate);

        foreach($data as $row)
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
        return $this->adminJson(["success" => true]);

    }








   }