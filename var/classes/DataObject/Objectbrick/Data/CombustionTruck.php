<?php 

/** 
Fields Summary: 
- mileage [quantityValue]
- fuelType [select]
- maxLoadCapacity [quantityValue]
- wheelCount [numeric]
*/ 

namespace Pimcore\Model\DataObject\Objectbrick\Data;

use Pimcore\Model\DataObject;
use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;
use Pimcore\Model\DataObject\PreGetValueHookInterface;


class CombustionTruck extends DataObject\Objectbrick\Data\AbstractData {

protected $type = "CombustionTruck";
protected $mileage;
protected $fuelType;
protected $maxLoadCapacity;
protected $wheelCount;


/**
* CombustionTruck constructor.
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
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CombustionTruck
*/
public function setMileage ($mileage) {
	$fd = $this->getDefinition()->getFieldDefinition("mileage");
	$this->mileage = $mileage;
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
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CombustionTruck
*/
public function setFuelType ($fuelType) {
	$fd = $this->getDefinition()->getFieldDefinition("fuelType");
	$this->fuelType = $fuelType;
	return $this;
}

/**
* Get maxLoadCapacity - MaxLoadCapacity
* @return \Pimcore\Model\DataObject\Data\QuantityValue|null
*/
public function getMaxLoadCapacity () {
	$data = $this->maxLoadCapacity;
	if(\Pimcore\Model\DataObject::doGetInheritedValues($this->getObject()) && $this->getDefinition()->getFieldDefinition("maxLoadCapacity")->isEmpty($data)) {
		try {
			return $this->getValueFromParent("maxLoadCapacity");
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
* Set maxLoadCapacity - MaxLoadCapacity
* @param \Pimcore\Model\DataObject\Data\QuantityValue|null $maxLoadCapacity
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CombustionTruck
*/
public function setMaxLoadCapacity ($maxLoadCapacity) {
	$fd = $this->getDefinition()->getFieldDefinition("maxLoadCapacity");
	$this->maxLoadCapacity = $maxLoadCapacity;
	return $this;
}

/**
* Get wheelCount - Wheel Count
* @return float|null
*/
public function getWheelCount () {
	$data = $this->wheelCount;
	if(\Pimcore\Model\DataObject::doGetInheritedValues($this->getObject()) && $this->getDefinition()->getFieldDefinition("wheelCount")->isEmpty($data)) {
		try {
			return $this->getValueFromParent("wheelCount");
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
* Set wheelCount - Wheel Count
* @param float|null $wheelCount
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CombustionTruck
*/
public function setWheelCount ($wheelCount) {
	$fd = $this->getDefinition()->getFieldDefinition("wheelCount");
	$this->wheelCount = $fd->preSetData($this, $wheelCount);
	return $this;
}

}

