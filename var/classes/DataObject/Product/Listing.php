<?php 

namespace Pimcore\Model\DataObject\Product;

use Pimcore\Model\DataObject;

/**
 * @method DataObject\Product current()
 * @method DataObject\Product[] load()
 */

class Listing extends DataObject\Listing\Concrete {

protected $classId = "3";
protected $className = "Product";


/**
* Filter by productSKU (Product SKU)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductSKU ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productSKU")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productName (Product Name)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductName ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productName")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productDescription (Product Description)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductDescription ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productDescription")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productBrand (Product Brand)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductBrand ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productBrand")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productCategory (Product Category)
* @param Element\ElementInterface|array $data   comparison element or ['id' => <element ID>, 'type' => <element type>]
* @param string $operator  SQL comparison operator, currently only "=" possible
* @return static
*/
public function filterByProductCategory ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productCategory")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productColour (Product Colour)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductColour ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productColour")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productLaunchDate (Product Launch Date)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductLaunchDate ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productLaunchDate")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by airbagCount (Airbag Count)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByAirbagCount ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("airbagCount")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productEngine (product Engine)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductEngine ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productEngine")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productCreatedAt (Product CreatedAt)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductCreatedAt ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productCreatedAt")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by productUpdatedAt (Product UpdatedAt)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByProductUpdatedAt ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("productUpdatedAt")->addListingFilter($this, $data, $operator);
	return $this;
}

/**
* Filter by isProductActive (isProductActive)
* @param string|int|float|float|array $data  comparison data, can be scalar or array (if operator is e.g. "IN (?)")
* @param string $operator  SQL comparison operator, e.g. =, <, >= etc. You can use "?" as placeholder, e.g. "IN (?)"
* @return static
*/
public function filterByIsProductActive ($data, $operator = '=') {
	$this->getClass()->getFieldDefinition("isProductActive")->addListingFilter($this, $data, $operator);
	return $this;
}



}
