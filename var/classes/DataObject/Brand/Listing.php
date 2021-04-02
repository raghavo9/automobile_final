<?php 

namespace Pimcore\Model\DataObject\Brand;

use Pimcore\Model\DataObject;

/**
 * @method DataObject\Brand current()
 * @method DataObject\Brand[] load()
 */

class Listing extends DataObject\Listing\Concrete {

protected $classId = "1";
protected $className = "Brand";


/**
* Filter by brandName (Brand Name)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByBrandName ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("brandName")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by brandDescription (Brand Description)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByBrandDescription ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("brandDescription")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by brandLogo (Brand Logo)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByBrandLogo ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("brandLogo")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by brandCreatedAt (Brand CreatedAt)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByBrandCreatedAt ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("brandCreatedAt")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by brandUpdatedAt (Brand UpdatedAt)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByBrandUpdatedAt ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("brandUpdatedAt")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by isBrandActive (isBrandActive)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByIsBrandActive ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("isBrandActive")->addListingFilter($this, $data, $operator);
	return $this;
}



}
