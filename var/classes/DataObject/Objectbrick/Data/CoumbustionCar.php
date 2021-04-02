<?php 

/** 
Fields Summary: 
- mileage [quantityValue]
- sunroof [checkbox]
- fuelType [select]
*/ 

namespace Pimcore\Model\DataObject\Objectbrick\Data;

use Pimcore\Model\DataObject;
use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;
use Pimcore\Model\DataObject\PreGetValueHookInterface;


class CoumbustionCar extends DataObject\Objectbrick\Data\AbstractData {

protected $type = "CoumbustionCar";
protected $mileage;
protected $sunroof;
protected $fuelType;


/**
* CoumbustionCar constructor.
* @param DataObject\Concrete $object
*/
public function __construct(DataObject\Concrete $object) {
	parent::__construct($object);
	$this->markFieldDirty("_self");
}


/**
* Get mileage - Mileage
* @return \Pimcore\Model\DataObject\Data\QuantityValue|null
*/
public function getMileage () {
	$data = $this->mileage;
	if(\Pimcore\Model\DataObject::doGetInheritedValues($this->getObject()) && $this->getDefinition()->getFieldDefinition("mileage")->isEmpty($data)) {
		try {
			return $this->getValueFromParent("mileage");
		} catch (InheritanceParentNotFoundException $e) {
			// no data from parent available, continue ... 
		}
	}
	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		return $data->getPlain();
	}
	 return $data;
}

/**
* Set mileage - Mileage
* @param \Pimcore\Model\DataObject\Data\QuantityValue|null $mileage
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CoumbustionCar
*/
public function setMileage ($mileage) {
	$fd = $this->getDefinition()->getFieldDefinition("mileage");
	$this->mileage = $mileage;
	return $this;
}

/**
* Get sunroof - Sunroof
* @return bool|null
*/
public function getSunroof () {
	$data = $this->sunroof;
	if(\Pimcore\Model\DataObject::doGetInheritedValues($this->getObject()) && $this->getDefinition()->getFieldDefinition("sunroof")->isEmpty($data)) {
		try {
			return $this->getValueFromParent("sunroof");
		} catch (InheritanceParentNotFoundException $e) {
			// no data from parent available, continue ... 
		}
	}
	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		return $data->getPlain();
	}
	 return $data;
}

/**
* Set sunroof - Sunroof
* @param bool|null $sunroof
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CoumbustionCar
*/
public function setSunroof ($sunroof) {
	$fd = $this->getDefinition()->getFieldDefinition("sunroof");
	$this->sunroof = $sunroof;
	return $this;
}

/**
* Get fuelType - Fuel Type
* @return string|null
*/
public function getFuelType () {
	$data = $this->fuelType;
	if(\Pimcore\Model\DataObject::doGetInheritedValues($this->getObject()) && $this->getDefinition()->getFieldDefinition("fuelType")->isEmpty($data)) {
		try {
			return $this->getValueFromParent("fuelType");
		} catch (InheritanceParentNotFoundException $e) {
			// no data from parent available, continue ... 
		}
	}
	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		return $data->getPlain();
	}
	 return $data;
}

/**
* Set fuelType - Fuel Type
* @param string|null $fuelType
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CoumbustionCar
*/
public function setFuelType ($fuelType) {
	$fd = $this->getDefinition()->getFieldDefinition("fuelType");
	$this->fuelType = $fuelType;
	return $this;
}

}

