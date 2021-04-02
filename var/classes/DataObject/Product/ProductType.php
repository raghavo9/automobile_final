<?php 

namespace Pimcore\Model\DataObject\Product;

use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;

class ProductType extends \Pimcore\Model\DataObject\Objectbrick {

protected $brickGetters = ['CombustionTruck','CoumbustionCar','ElectricCar','ElectricTruck'];


protected $CombustionTruck = null;

/**
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CombustionTruck|null
*/
public function getCombustionTruck() { 
   return $this->CombustionTruck; 
}

/**
* @param \Pimcore\Model\DataObject\Objectbrick\Data\CombustionTruck $CombustionTruck
* @return \Pimcore\Model\DataObject\Product\ProductType
*/
public function setCombustionTruck ($CombustionTruck) {
	$this->CombustionTruck = $CombustionTruck;
	return $this;
}

protected $CoumbustionCar = null;

/**
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CoumbustionCar|null
*/
public function getCoumbustionCar() { 
   return $this->CoumbustionCar; 
}

/**
* @param \Pimcore\Model\DataObject\Objectbrick\Data\CoumbustionCar $CoumbustionCar
* @return \Pimcore\Model\DataObject\Product\ProductType
*/
public function setCoumbustionCar ($CoumbustionCar) {
	$this->CoumbustionCar = $CoumbustionCar;
	return $this;
}

protected $ElectricCar = null;

/**
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricCar|null
*/
public function getElectricCar() { 
   return $this->ElectricCar; 
}

/**
* @param \Pimcore\Model\DataObject\Objectbrick\Data\ElectricCar $ElectricCar
* @return \Pimcore\Model\DataObject\Product\ProductType
*/
public function setElectricCar ($ElectricCar) {
	$this->ElectricCar = $ElectricCar;
	return $this;
}

protected $ElectricTruck = null;

/**
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricTruck|null
*/
public function getElectricTruck() { 
   return $this->ElectricTruck; 
}

/**
* @param \Pimcore\Model\DataObject\Objectbrick\Data\ElectricTruck $ElectricTruck
* @return \Pimcore\Model\DataObject\Product\ProductType
*/
public function setElectricTruck ($ElectricTruck) {
	$this->ElectricTruck = $ElectricTruck;
	return $this;
}

}

