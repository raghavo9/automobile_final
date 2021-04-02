<?php 

/** 
* Inheritance: no
* Variants: no


Fields Summary: 
- productSKU [input]
- productName [input]
- productDescription [wysiwyg]
- productBrand [select]
- productCategory [manyToOneRelation]
- productImages [fieldcollections]
- productPrice [quantityValue]
- productColour [input]
- productLaunchDate [date]
- airbagCount [numeric]
- productEngine [input]
- productLength [quantityValue]
- productCreatedAt [date]
- productUpdatedAt [date]
- isProductActive [checkbox]
- ProductType [objectbricks]
*/ 

namespace Pimcore\Model\DataObject;

use Pimcore\Model\DataObject\Exception\InheritanceParentNotFoundException;
use Pimcore\Model\DataObject\PreGetValueHookInterface;

/**
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductSKU ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductName ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductDescription ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductBrand ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductCategory ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductColour ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductLaunchDate ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByAirbagCount ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductEngine ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductCreatedAt ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByProductUpdatedAt ($value, $limit = 0, $offset = 0) 
* @method static \Pimcore\Model\DataObject\Product\Listing|\Pimcore\Model\DataObject\Product getByIsProductActive ($value, $limit = 0, $offset = 0) 
*/

class Product extends Concrete {

protected $o_classId = "3";
protected $o_className = "Product";
protected $productSKU;
protected $productName;
protected $productDescription;
protected $productBrand;
protected $productCategory;
protected $productImages;
protected $productPrice;
protected $productColour;
protected $productLaunchDate;
protected $airbagCount;
protected $productEngine;
protected $productLength;
protected $productCreatedAt;
protected $productUpdatedAt;
protected $isProductActive;
protected $ProductType;


/**
* @param array $values
* @return \Pimcore\Model\DataObject\Product
*/
public static function create($values = array()) {
	$object = new static();
	$object->setValues($values);
	return $object;
}

/**
* Get productSKU - Product SKU
* @return string|null
*/
public function getProductSKU () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productSKU"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productSKU;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productSKU - Product SKU
* @param string|null $productSKU
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductSKU ($productSKU) {
	$fd = $this->getClass()->getFieldDefinition("productSKU");
	$this->productSKU = $productSKU;
	return $this;
}

/**
* Get productName - Product Name
* @return string|null
*/
public function getProductName () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productName"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productName;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productName - Product Name
* @param string|null $productName
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductName ($productName) {
	$fd = $this->getClass()->getFieldDefinition("productName");
	$this->productName = $productName;
	return $this;
}

/**
* Get productDescription - Product Description
* @return string|null
*/
public function getProductDescription () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productDescription"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->getClass()->getFieldDefinition("productDescription")->preGetData($this);

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productDescription - Product Description
* @param string|null $productDescription
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductDescription ($productDescription) {
	$fd = $this->getClass()->getFieldDefinition("productDescription");
	$this->productDescription = $productDescription;
	return $this;
}

/**
* Get productBrand - Product Brand
* @return string|null
*/
public function getProductBrand () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productBrand"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productBrand;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productBrand - Product Brand
* @param string|null $productBrand
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductBrand ($productBrand) {
	$fd = $this->getClass()->getFieldDefinition("productBrand");
	$this->productBrand = $productBrand;
	return $this;
}

/**
* Get productCategory - Product Category
* @return \Pimcore\Model\DataObject\Category|null
*/
public function getProductCategory () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productCategory"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->getClass()->getFieldDefinition("productCategory")->preGetData($this);

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productCategory - Product Category
* @param \Pimcore\Model\DataObject\Category $productCategory
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductCategory ($productCategory) {
	$fd = $this->getClass()->getFieldDefinition("productCategory");
	$hideUnpublished = \Pimcore\Model\DataObject\Concrete::getHideUnpublished();
	\Pimcore\Model\DataObject\Concrete::setHideUnpublished(false);
	$currentData = $this->getProductCategory();
	\Pimcore\Model\DataObject\Concrete::setHideUnpublished($hideUnpublished);
	$isEqual = $fd->isEqual($currentData, $productCategory);
	if (!$isEqual) {
		$this->markFieldDirty("productCategory", true);
	}
	$this->productCategory = $fd->preSetData($this, $productCategory);
	return $this;
}

/**
* @return \Pimcore\Model\DataObject\Fieldcollection|null
*/
public function getProductImages () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productImages"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->getClass()->getFieldDefinition("productImages")->preGetData($this);
	 return $data;
}

/**
* Set productImages - Product Images
* @param \Pimcore\Model\DataObject\Fieldcollection|null $productImages
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductImages ($productImages) {
	$fd = $this->getClass()->getFieldDefinition("productImages");
	$this->productImages = $fd->preSetData($this, $productImages);
	return $this;
}

/**
* Get productPrice - Product Price
* @return \Pimcore\Model\DataObject\Data\QuantityValue|null
*/
public function getProductPrice () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productPrice"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productPrice;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productPrice - Product Price
* @param \Pimcore\Model\DataObject\Data\QuantityValue|null $productPrice
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductPrice ($productPrice) {
	$fd = $this->getClass()->getFieldDefinition("productPrice");
	$this->productPrice = $productPrice;
	return $this;
}

/**
* Get productColour - Product Colour
* @return string|null
*/
public function getProductColour () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productColour"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productColour;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productColour - Product Colour
* @param string|null $productColour
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductColour ($productColour) {
	$fd = $this->getClass()->getFieldDefinition("productColour");
	$this->productColour = $productColour;
	return $this;
}

/**
* Get productLaunchDate - Product Launch Date
* @return \Carbon\Carbon|null
*/
public function getProductLaunchDate () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productLaunchDate"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productLaunchDate;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productLaunchDate - Product Launch Date
* @param \Carbon\Carbon|null $productLaunchDate
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductLaunchDate ($productLaunchDate) {
	$fd = $this->getClass()->getFieldDefinition("productLaunchDate");
	$this->productLaunchDate = $productLaunchDate;
	return $this;
}

/**
* Get airbagCount - Airbag Count
* @return float|null
*/
public function getAirbagCount () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("airbagCount"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->airbagCount;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set airbagCount - Airbag Count
* @param float|null $airbagCount
* @return \Pimcore\Model\DataObject\Product
*/
public function setAirbagCount ($airbagCount) {
	$fd = $this->getClass()->getFieldDefinition("airbagCount");
	$this->airbagCount = $fd->preSetData($this, $airbagCount);
	return $this;
}

/**
* Get productEngine - product Engine
* @return string|null
*/
public function getProductEngine () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productEngine"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productEngine;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productEngine - product Engine
* @param string|null $productEngine
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductEngine ($productEngine) {
	$fd = $this->getClass()->getFieldDefinition("productEngine");
	$this->productEngine = $productEngine;
	return $this;
}

/**
* Get productLength - Product Length
* @return \Pimcore\Model\DataObject\Data\QuantityValue|null
*/
public function getProductLength () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productLength"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productLength;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productLength - Product Length
* @param \Pimcore\Model\DataObject\Data\QuantityValue|null $productLength
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductLength ($productLength) {
	$fd = $this->getClass()->getFieldDefinition("productLength");
	$this->productLength = $productLength;
	return $this;
}

/**
* Get productCreatedAt - Product CreatedAt
* @return \Carbon\Carbon|null
*/
public function getProductCreatedAt () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productCreatedAt"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productCreatedAt;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productCreatedAt - Product CreatedAt
* @param \Carbon\Carbon|null $productCreatedAt
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductCreatedAt ($productCreatedAt) {
	$fd = $this->getClass()->getFieldDefinition("productCreatedAt");
	$this->productCreatedAt = $productCreatedAt;
	return $this;
}

/**
* Get productUpdatedAt - Product UpdatedAt
* @return \Carbon\Carbon|null
*/
public function getProductUpdatedAt () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("productUpdatedAt"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->productUpdatedAt;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set productUpdatedAt - Product UpdatedAt
* @param \Carbon\Carbon|null $productUpdatedAt
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductUpdatedAt ($productUpdatedAt) {
	$fd = $this->getClass()->getFieldDefinition("productUpdatedAt");
	$this->productUpdatedAt = $productUpdatedAt;
	return $this;
}

/**
* Get isProductActive - isProductActive
* @return bool|null
*/
public function getIsProductActive () {
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("isProductActive"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	$data = $this->isProductActive;

	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}

	return $data;
}

/**
* Set isProductActive - isProductActive
* @param bool|null $isProductActive
* @return \Pimcore\Model\DataObject\Product
*/
public function setIsProductActive ($isProductActive) {
	$fd = $this->getClass()->getFieldDefinition("isProductActive");
	$this->isProductActive = $isProductActive;
	return $this;
}

/**
* @return \Pimcore\Model\DataObject\Product\ProductType
*/
public function getProductType () {
	$data = $this->ProductType;
	if(!$data) { 
		if(\Pimcore\Tool::classExists("\\Pimcore\\Model\\DataObject\\Product\\ProductType")) { 
			$data = new \Pimcore\Model\DataObject\Product\ProductType($this, "ProductType");
			$this->ProductType = $data;
		} else {
			return null;
		}
	}
	if($this instanceof PreGetValueHookInterface && !\Pimcore::inAdmin()) { 
		$preValue = $this->preGetValue("ProductType"); 
		if($preValue !== null) { 
			return $preValue;
		}
	} 

	 return $data;
}

/**
* Set ProductType - ProductType
* @param \Pimcore\Model\DataObject\Objectbrick $ProductType
* @return \Pimcore\Model\DataObject\Product
*/
public function setProductType ($ProductType) {
	$fd = $this->getClass()->getFieldDefinition("ProductType");
	$this->ProductType = $fd->preSetData($this, $ProductType);
	return $this;
}

}

