<?php 

/** 
Fields Summary: 
- mileage [quantityValue]
- sunroof [checkbox]
- fuelType [select]
*/ 


return Pimcore\Model\DataObject\Objectbrick\Definition::__set_state(array(
   'classDefinitions' => 
  array (
    0 => 
    array (
      'classname' => 'Product',
      'fieldname' => 'ProductType',
    ),
  ),
   'dao' => NULL,
   'key' => 'CoumbustionCar',
   'parentClass' => '',
   'implementsInterfaces' => '',
   'title' => '',
   'group' => '',
   'layoutDefinitions' => 
  Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
     'fieldtype' => 'panel',
     'labelWidth' => 100,
     'layout' => NULL,
     'border' => false,
     'name' => NULL,
     'type' => NULL,
     'region' => NULL,
     'title' => NULL,
     'width' => NULL,
     'height' => NULL,
     'collapsible' => false,
     'collapsed' => false,
     'bodyStyle' => NULL,
     'datatype' => 'layout',
     'permissions' => NULL,
     'childs' => 
    array (
      0 => 
      Pimcore\Model\DataObject\ClassDefinition\Layout\Panel::__set_state(array(
         'fieldtype' => 'panel',
         'labelWidth' => 100,
         'layout' => NULL,
         'border' => false,
         'name' => 'Layout',
         'type' => NULL,
         'region' => NULL,
         'title' => '',
         'width' => NULL,
         'height' => NULL,
         'collapsible' => false,
         'collapsed' => false,
         'bodyStyle' => '',
         'datatype' => 'layout',
         'permissions' => NULL,
         'childs' => 
        array (
          0 => 
          Pimcore\Model\DataObject\ClassDefinition\Data\QuantityValue::__set_state(array(
             'fieldtype' => 'quantityValue',
             'width' => NULL,
             'unitWidth' => NULL,
             'defaultValue' => NULL,
             'defaultUnit' => NULL,
             'validUnits' => 
            array (
              0 => '7',
            ),
             'decimalPrecision' => NULL,
             'autoConvert' => false,
             'queryColumnType' => 
            array (
              'value' => 'double',
              'unit' => 'varchar(50)',
            ),
             'columnType' => 
            array (
              'value' => 'double',
              'unit' => 'varchar(50)',
            ),
             'phpdocType' => '\\Pimcore\\Model\\DataObject\\Data\\QuantityValue',
             'name' => 'mileage',
             'title' => 'Mileage',
             'tooltip' => '',
             'mandatory' => false,
             'noteditable' => false,
             'index' => false,
             'locked' => false,
             'style' => '',
             'permissions' => NULL,
             'datatype' => 'data',
             'relationType' => false,
             'invisible' => false,
             'visibleGridView' => false,
             'visibleSearch' => false,
             'defaultValueGenerator' => '',
          )),
          1 => 
          Pimcore\Model\DataObject\ClassDefinition\Data\Checkbox::__set_state(array(
             'fieldtype' => 'checkbox',
             'defaultValue' => NULL,
             'queryColumnType' => 'tinyint(1)',
             'columnType' => 'tinyint(1)',
             'phpdocType' => 'bool',
             'name' => 'sunroof',
             'title' => 'Sunroof',
             'tooltip' => '',
             'mandatory' => false,
             'noteditable' => false,
             'index' => false,
             'locked' => false,
             'style' => '',
             'permissions' => NULL,
             'datatype' => 'data',
             'relationType' => false,
             'invisible' => false,
             'visibleGridView' => false,
             'visibleSearch' => false,
             'defaultValueGenerator' => '',
          )),
          2 => 
          Pimcore\Model\DataObject\ClassDefinition\Data\Select::__set_state(array(
             'fieldtype' => 'select',
             'options' => 
            array (
              0 => 
              array (
                'key' => 'Diesel',
                'value' => 'Diesel',
              ),
              1 => 
              array (
                'key' => 'Petrol',
                'value' => 'Petrol',
              ),
              2 => 
              array (
                'key' => 'CNG',
                'value' => 'CNG',
              ),
            ),
             'width' => '',
             'defaultValue' => '',
             'optionsProviderClass' => '',
             'optionsProviderData' => '',
             'queryColumnType' => 'varchar',
             'columnType' => 'varchar',
             'columnLength' => 190,
             'phpdocType' => 'string',
             'dynamicOptions' => false,
             'name' => 'fuelType',
             'title' => 'Fuel Type',
             'tooltip' => '',
             'mandatory' => false,
             'noteditable' => false,
             'index' => false,
             'locked' => false,
             'style' => '',
             'permissions' => NULL,
             'datatype' => 'data',
             'relationType' => false,
             'invisible' => false,
             'visibleGridView' => false,
             'visibleSearch' => false,
             'defaultValueGenerator' => '',
          )),
        ),
         'locked' => false,
         'icon' => '',
      )),
    ),
     'locked' => false,
     'icon' => NULL,
  )),
   'generateTypeDeclarations' => false,
));
