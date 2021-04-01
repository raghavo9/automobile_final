<?php 

/** 
Fields Summary: 
- batteryCapacity [quantityValue]
- mileage [quantityValue]
- sunroof [checkbox]
*/ 

namespace Pimcore\Model\DataObject\Objectbrick\Data;

use Pimcore\Model\DataObject;
use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;
use Pimcore\Model\DataObject\PreGetValueHookInterface;


class ElectricCar extends DataObject\Objectbrick\Data\AbstractData {

protected $type = "ElectricCar";
protected $batteryCapacity;
protected $mileage;
protected $sunroof;


/**
* ElectricCar constructor.
* @param DataObject\Concrete $object
*/
public function __construct(DataObject\Concrete $object) {
	parent::__construct($object);
	$this->markFieldDirty("_self");
}


/**
* Get batteryCapacity - Battery Capacity
* @return \Pimcore\Model\DataObject\Data\QuantityValue|null
*/
public function getBatteryCapacity () {
	$data = $this->batteryCapacity;
	if(\Pimcore\Model\DataObject::doGetInheritedValues($this->getObject()) && $this->getDefinition()->getFieldDefinition("batteryCapacity")->isEmpty($data)) {
		try {
			return $this->getValueFromParent("batteryCapacity");
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
* Set batteryCapacity - Battery Capacity
* @param \Pimcore\Model\DataObject\Data\QuantityValue|null $batteryCapacity
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricCar
*/
public function setBatteryCapacity ($batteryCapacity) {
	$fd = $this->getDefinition()->getFieldDefinition("batteryCapacity");
	$this->batteryCapacity = $batteryCapacity;
	return $this;
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
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricCar
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
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricCar
*/
public function setSunroof ($sunroof) {
	$fd = $this->getDefinition()->getFieldDefinition("sunroof");
	$this->sunroof = $sunroof;
	return $this;
}

}

