<?php

namespace AppBundle\OptionsProvider;

use Pimcore\Model\DataObject\Category;
use Pimcore\Model\DataObject\ClassDefinition\DynamicOptionsProvider\SelectOptionsProviderInterface;

class ProductCategory implements SelectOptionsProviderInterface
{
    /**
     * @param $context array
     * @param $fieldDefinition Data
     * @return array
     */
    public function getOptions($context, $fieldDefinition)
    {
        $result = array();

        $brands = new Category\Listing();
        $brands->setCondition("isCategoryActive=?",true);
        foreach($brands as $brand){
            array_push($result, [ "key" =>$brand->getCategoryName(), "value"=>$brand->getCategoryName()]);
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