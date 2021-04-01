<?php 

/** 
* Inheritance: no
* Variants: no


Fields Summary: 
- brandName [input]
- brandDescription [wysiwyg]
- brandLogo [image]
- brandCreatedAt [date]
- brandUpdatedAt [date]
- isBrandActive [checkbox]
*/ 

namespace Pimcore\Model\DataObject;

use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;
use Pimcore\Model\DataObject\PreGetValueHookInterface;

/**
* @method static \Pimcore\Model\DataObject\Brand\Listing|\Pimcore\Model\DataObject\Brand getByBrandName ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Brand\Listing|\Pimcore\Model\DataObject\Brand getByBrandDescription ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Brand\Listing|\Pimcore\Model\DataObject\Brand getByBrandLogo ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Brand\Listing|\Pimcore\Model\DataObject\Brand getByBrandCreatedAt ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Brand\Listing|\Pimcore\Model\DataObject\Brand getByBrandUpdatedAt ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Brand\Listing|\Pimcore\Model\DataObject\Brand getByIsBrandActive ($value, $limit = 0, $offset = 0) 
*/

class Brand extends Concrete {

protected $o_classId = "1";
protected $o_className = "Brand";
protected $brandName;
protected $brandDescription;
protected $brandLogo;
protected $brandCreatedAt;
protected $brandUpdatedAt;
protected $isBrandActive;


/**
* @param array $values
* @return \Pimcore\Model\DataObject\Brand
*/
public static function create($values = array()) {
	$object = new static();
	$object->setValues($values);
	return $object;
}

/**
* Get brandName - Brand Name
* @return string|null
*/
public function getBrandName () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("brandName"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->brandName;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set brandName - Brand Name
* @param string|null $brandName
* @return \Pimcore\Model\DataObject\Brand
*/
public function setBrandName ($brandName) {
	$fd = $this->getClass()->getFieldDefinition("brandName");
	$this->brandName = $brandName;
	return $this;
}

/**
* Get brandDescription - Brand Description
* @return string|null
*/
public function getBrandDescription () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("brandDescription"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->getClass()->getFieldDefinition("brandDescription")->preGetData($this);

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set brandDescription - Brand Description
* @param string|null $brandDescription
* @return \Pimcore\Model\DataObject\Brand
*/
public function setBrandDescription ($brandDescription) {
	$fd = $this->getClass()->getFieldDefinition("brandDescription");
	$this->brandDescription = $brandDescription;
	return $this;
}

/**
* Get brandLogo - Brand Logo
* @return \Pimcore\Model\Asset\Image|null
*/
public function getBrandLogo () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("brandLogo"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->brandLogo;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set brandLogo - Brand Logo
* @param \Pimcore\Model\Asset\Image|null $brandLogo
* @return \Pimcore\Model\DataObject\Brand
*/
public function setBrandLogo ($brandLogo) {
	$fd = $this->getClass()->getFieldDefinition("brandLogo");
	$this->brandLogo = $brandLogo;
	return $this;
}

/**
* Get brandCreatedAt - Brand CreatedAt
* @return \Carbon\Carbon|null
*/
public function getBrandCreatedAt () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("brandCreatedAt"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->brandCreatedAt;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set brandCreatedAt - Brand CreatedAt
* @param \Carbon\Carbon|null $brandCreatedAt
* @return \Pimcore\Model\DataObject\Brand
*/
public function setBrandCreatedAt ($brandCreatedAt) {
	$fd = $this->getClass()->getFieldDefinition("brandCreatedAt");
	$this->brandCreatedAt = $brandCreatedAt;
	return $this;
}

/**
* Get brandUpdatedAt - Brand UpdatedAt
* @return \Carbon\Carbon|null
*/
public function getBrandUpdatedAt () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("brandUpdatedAt"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->brandUpdatedAt;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set brandUpdatedAt - Brand UpdatedAt
* @param \Carbon\Carbon|null $brandUpdatedAt
* @return \Pimcore\Model\DataObject\Brand
*/
public function setBrandUpdatedAt ($brandUpdatedAt) {
	$fd = $this->getClass()->getFieldDefinition("brandUpdatedAt");
	$this->brandUpdatedAt = $brandUpdatedAt;
	return $this;
}

/**
* Get isBrandActive - isBrandActive
* @return bool|null
*/
public function getIsBrandActive () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("isBrandActive"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->isBrandActive;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set isBrandActive - isBrandActive
* @param bool|null $isBrandActive
* @return \Pimcore\Model\DataObject\Brand
*/
public function setIsBrandActive ($isBrandActive) {
	$fd = $this->getClass()->getFieldDefinition("isBrandActive");
	$this->isBrandActive = $isBrandActive;
	return $this;
}

}

