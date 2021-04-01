<?php 

/** 
Fields Summary: 
- productImage [image]
*/ 

namespace Pimcore\Model\DataObject\Fieldcollection\Data;

use Pimcore\Model\DataObject;
use Pimcore\Model\DataObject\PreGetValueHookInterface;

class ProductImages extends DataObject\Fieldcollection\Data\AbstractData {

protected $type = "productImages";
protected $productImage;


/**
* Get productImage - Product Image
* @return \Pimcore\Model\Asset\Image|null
*/
public function getProductImage () {
	$data = $this->productImage;
	if ($data instanceof \Pimcore\Model\DataObject\Data\EncryptedField) {
		    return $data->getPlain();
	}
	 return $data;
}

/**
* Set productImage - Product Image
* @param \Pimcore\Model\Asset\Image|null $productImage
* @return \Pimcore\Model\DataObject\Fieldcollection\Data\ProductImages
*/
public function setProductImage ($productImage) {
	$fd = $this->getDefinition()->getFieldDefinition("productImage");
	$this->productImage = $productImage;
	return $this;
}

}

