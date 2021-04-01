<?php 

/** 
Fields Summary: 
- mileage [quantityValue]
- maxLoadCapacity [quantityValue]
- wheelCount [numeric]
*/ 

namespace Pimcore\Model\DataObject\Objectbrick\Data;

use Pimcore\Model\DataObject;
use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;
use Pimcore\Model\DataObject\PreGetValueHookInterface;


class ElectricTruck extends DataObject\Objectbrick\Data\AbstractData {

protected $type = "ElectricTruck";
protected $mileage;
protected $maxLoadCapacity;
protected $wheelCount;


/**
* ElectricTruck constructor.
* @param DataObject\Concrete $object
*/
public function __construct(DataObject\Concrete $object) {
	parent::__construct($object);
	$this->markFieldDirty("_self");
}


/**
* Get mileage - mileage
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
* Set mileage - mileage
* @param \Pimcore\Model\DataObject\Data\QuantityValue|null $mileage
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricTruck
*/
public function setMileage ($mileage) {
	$fd = $this->getDefinition()->getFieldDefinition("mileage");
	$this->mileage = $mileage;
	return $this;
}

/**
* Get maxLoadCapacity - Max Load Capacity
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
* Set maxLoadCapacity - Max Load Capacity
* @param \Pimcore\Model\DataObject\Data\QuantityValue|null $maxLoadCapacity
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricTruck
*/
public function setMaxLoadCapacity ($maxLoadCapacity) {
	$fd = $this->getDefinition()->getFieldDefinition("maxLoadCapacity");
	$this->maxLoadCapacity = $maxLoadCapacity;
	return $this;
}

/**
* Get wheelCount - wheelCount
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
* Set wheelCount - wheelCount
* @param float|null $wheelCount
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricTruck
*/
public function setWheelCount ($wheelCount) {
	$fd = $this->getDefinition()->getFieldDefinition("wheelCount");
	$this->wheelCount = $fd->preSetData($this, $wheelCount);
	return $this;
}

}

