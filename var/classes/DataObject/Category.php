<?php 

/** 
* Inheritance: no
* Variants: no


Fields Summary: 
- categoryName [input]
- categoryDescription [wysiwyg]
- categoryCreatedAt [date]
- categoryUpdatedAt [date]
- isCategoryActive [checkbox]
*/ 

namespace Pimcore\Model\DataObject;

use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;
use Pimcore\Model\DataObject\PreGetValueHookInterface;

/**
* @method static \Pimcore\Model\DataObject\Category\Listing|\Pimcore\Model\DataObject\Category getByCategoryName ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Category\Listing|\Pimcore\Model\DataObject\Category getByCategoryDescription ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Category\Listing|\Pimcore\Model\DataObject\Category getByCategoryCreatedAt ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Category\Listing|\Pimcore\Model\DataObject\Category getByCategoryUpdatedAt ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Category\Listing|\Pimcore\Model\DataObject\Category getByIsCategoryActive ($value, $limit = 0, $offset = 0) 
*/

class Category extends Concrete {

protected $o_classId = "2";
protected $o_className = "Category";
protected $categoryName;
protected $categoryDescription;
protected $categoryCreatedAt;
protected $categoryUpdatedAt;
protected $isCategoryActive;


/**
* @param array $values
* @return \Pimcore\Model\DataObject\Category
*/
public static function create($values = array()) {
	$object = new static();
	$object->setValues($values);
	return $object;
}

/**
* Get categoryName - Category Name
* @return string|null
*/
public function getCategoryName () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("categoryName"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->categoryName;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set categoryName - Category Name
* @param string|null $categoryName
* @return \Pimcore\Model\DataObject\Category
*/
public function setCategoryName ($categoryName) {
	$fd = $this->getClass()->getFieldDefinition("categoryName");
	$this->categoryName = $categoryName;
	return $this;
}

/**
* Get categoryDescription - Category Description
* @return string|null
*/
public function getCategoryDescription () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("categoryDescription"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->getClass()->getFieldDefinition("categoryDescription")->preGetData($this);

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set categoryDescription - Category Description
* @param string|null $categoryDescription
* @return \Pimcore\Model\DataObject\Category
*/
public function setCategoryDescription ($categoryDescription) {
	$fd = $this->getClass()->getFieldDefinition("categoryDescription");
	$this->categoryDescription = $categoryDescription;
	return $this;
}

/**
* Get categoryCreatedAt - Category CreatedAt
* @return \Carbon\Carbon|null
*/
public function getCategoryCreatedAt () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("categoryCreatedAt"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->categoryCreatedAt;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set categoryCreatedAt - Category CreatedAt
* @param \Carbon\Carbon|null $categoryCreatedAt
* @return \Pimcore\Model\DataObject\Category
*/
public function setCategoryCreatedAt ($categoryCreatedAt) {
	$fd = $this->getClass()->getFieldDefinition("categoryCreatedAt");
	$this->categoryCreatedAt = $categoryCreatedAt;
	return $this;
}

/**
* Get categoryUpdatedAt - Category UpdatedAt
* @return \Carbon\Carbon|null
*/
public function getCategoryUpdatedAt () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("categoryUpdatedAt"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->categoryUpdatedAt;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set categoryUpdatedAt - Category UpdatedAt
* @param \Carbon\Carbon|null $categoryUpdatedAt
* @return \Pimcore\Model\DataObject\Category
*/
public function setCategoryUpdatedAt ($categoryUpdatedAt) {
	$fd = $this->getClass()->getFieldDefinition("categoryUpdatedAt");
	$this->categoryUpdatedAt = $categoryUpdatedAt;
	return $this;
}

/**
* Get isCategoryActive - isCategoryActive
* @return bool|null
*/
public function getIsCategoryActive () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("isCategoryActive"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->isCategoryActive;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set isCategoryActive - isCategoryActive
* @param bool|null $isCategoryActive
* @return \Pimcore\Model\DataObject\Category
*/
public function setIsCategoryActive ($isCategoryActive) {
	$fd = $this->getClass()->getFieldDefinition("isCategoryActive");
	$this->isCategoryActive = $isCategoryActive;
	return $this;
}

}

