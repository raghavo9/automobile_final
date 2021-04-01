<?php 

namespace Pimcore\Model\DataObject\Category;

use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;

class ProductCategory extends \Pimcore\Model\DataObject\Objectbrick {

protected $brickGetters = ['CombustionVehicle','ElectricVehicle','Trucks'];


protected $CombustionVehicle = null;

/**
* @return \Pimcore\Model\DataObject\Objectbrick\Data\CombustionVehicle|null
*/
public function getCombustionVehicle() { 
   return $this->CombustionVehicle; 
}

/**
* @param \Pimcore\Model\DataObject\Objectbrick\Data\CombustionVehicle $CombustionVehicle
* @return \Pimcore\Model\DataObject\Category\ProductCategory
*/
public function setCombustionVehicle ($CombustionVehicle) {
	$this->CombustionVehicle = $CombustionVehicle;
	return $this;
}

protected $ElectricVehicle = null;

/**
* @return \Pimcore\Model\DataObject\Objectbrick\Data\ElectricVehicle|null
*/
public function getElectricVehicle() { 
   return $this->ElectricVehicle; 
}

/**
* @param \Pimcore\Model\DataObject\Objectbrick\Data\ElectricVehicle $ElectricVehicle
* @return \Pimcore\Model\DataObject\Category\ProductCategory
*/
public function setElectricVehicle ($ElectricVehicle) {
	$this->ElectricVehicle = $ElectricVehicle;
	return $this;
}

protected $Trucks = null;

/**
* @return \Pimcore\Model\DataObject\Objectbrick\Data\Trucks|null
*/
public function getTrucks() { 
   return $this->Trucks; 
}

/**
* @param \Pimcore\Model\DataObject\Objectbrick\Data\Trucks $Trucks
* @return \Pimcore\Model\DataObject\Category\ProductCategory
*/
public function setTrucks ($Trucks) {
	$this->Trucks = $Trucks;
	return $this;
}

}

