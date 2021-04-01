<?php 

namespace Pimcore\Model\DataObject\Category;

use Pimcore\Model\DataObject;

/**
 * @method DataObject\Category current()
 * @method DataObject\Category[] load()
 */

class Listing extends DataObject\Listing\Concrete {

protected $classId = "2";
protected $className = "Category";


/**
* Filter by categoryName (Category Name)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByCategoryName ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("categoryName")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by categoryDescription (Category Description)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByCategoryDescription ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("categoryDescription")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by categoryCreatedAt (Category CreatedAt)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByCategoryCreatedAt ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("categoryCreatedAt")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by categoryUpdatedAt (Category UpdatedAt)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByCategoryUpdatedAt ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("categoryUpdatedAt")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by isCategoryActive (isCategoryActive)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByIsCategoryActive ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("isCategoryActive")->addListingFilter($this, $data, $operator);
	return $this;
}



}
