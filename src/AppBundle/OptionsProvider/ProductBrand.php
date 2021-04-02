<?php

namespace AppBundle\OptionsProvider;

use Pimcore\Model\DataObject\Brand;
use Pimcore\Model\DataObject\ClassDefinition\DynamicOptionsProvider\SelectOptionsProviderInterface;

class ProductBrand implements SelectOptionsProviderInterface
{
    /**
     * @param $context array
     * @param $fieldDefinition Data
     * @return array
     */
    public function getOptions($context, $fieldDefinition)
    {
        $result = array();

        $brands = new Brand\Listing();
        $brands->setCondition("isBrandActive=?",true);
        foreach($brands as $brand){
            array_push($result, [ "key" =>$brand->getBrandName(), "value"=>$brand->getBrandName()]);
        }
        return $result;
    }

    /**
     * Returns the value which is defined in the 'Default value' field  
     * @param array $context 
     * @param Data $fieldDefinition 
     * @return mixed
     */
    public function getDefaultValue($context, $fieldDefinition) {
        return $fieldDefinition->getDefaultValue();
    }

    /**
     * @param array $context 
     * @param Data $fieldDefinition 
     * @return bool
     */
    public function hasStaticOptions($context, $fieldDefinition) {
        return true;
    }
}