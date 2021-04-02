<?php
    namespace AppBundle\EventListener;
    use Pimcore\Event\Model\DataObjectEvent;
    use Pimcore\Model\DataObject\Product;

    class TestListener {

        /**
        * @param DataObjectEvent $e
        */
     
        public function dateValidation(DataObjectEvent $e) {
       
      
            if ($e->getObject() instanceof Product) {
                $t=date("Y-m-d");
                $prod=$e->getObject();
                if($prod->getProductCreatedAt()<$t){

                throw new \Pimcore\Model\Element\ValidationException("should be greater than todays date");
                }
                //$prod = $e->getObject(); 
                if($prod->getProductPrice()->getvalue() < 0 ){
throw new \Pimcore\Model\Element\ValidationException("Price is negative");
                }
            }
        }
    }
    