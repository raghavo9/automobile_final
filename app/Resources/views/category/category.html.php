<?php
/**
 * @var \Pimcore\Templating\PhpEngine $this
 * @var \Pimcore\Templating\PhpEngine $view
 * @var \Pimcore\Templating\GlobalVariables $app
 */


define("BASE", "http://pim.local");


?>

<!DOCTYPE html>
<html lang="en" >
<head>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

  <meta charset="UTF-8">
  <title>Pure CSS - Simple Menu Navigation</title>
      <link href='https://fonts.googleapis.com/css?family=Oswald:300' rel='stylesheet' type='text/css'>
	<style>
	/* Common Styles - Can ignore*/
	.menu-4 {
  text-align: center;
  text-transform: uppercase;
  font-weight: 500;
}
.menu-4 * {
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.menu-4 li {
  display: inline-block;
  list-style: outside none none;
  margin: 0 1.5em;
  overflow: hidden;
}
.menu-4 a {
  padding: 0.3em 0;
  color: #FFFFFF;
  position: relative;
  display: inline-block;
  letter-spacing: 1px;
  margin: 0;
  text-decoration: none;
}
.menu-4 a:before,
.menu-4 a:after {
  position: absolute;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.menu-4 a:before {
  bottom: 100%;
  display: block;
  height: 3px;
  width: 100%;
  content: "";
  background-color: #e67e22;
}
.menu-4 a:after {
  padding: 0.3em 0;
  position: absolute;
  bottom: 100%;
  left: 0;
  content: attr(data-hover);
  color: WHITE;
  white-space: nowrap;
}
.menu-4 li:hover a,
.menu-4 .current a {
  transform: translateY(100%);
}
	body{
	 background-image: url('https://www.desktopbackground.org/p/2010/12/25/131676_free-cars-wallpapers-wallpapers-hd-1080p-autozonegallery-com_2560x1600_h.jpg');
  background-size: cover;
  background-position: center;
	  height: 100vh;
	}
	h1{
	  color:#FFFFFF;
	  font-weight:100;
	}
	.spacer {
	 padding: 30px 0;
	}

    .pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}




	</style>
</head>

<body>



<!-- Style 4 Start -->
	
	<nav class="style-4">
		<ul class="menu-4">
          <li class="current"><a href="http://pim.local/home" data-hover="HOMES" >HOME</a></li>
		  <li><a href="http://pim.local/products" data-hover="Product">PRODUCT </a></li>
		  <li><a href="http://pim.local/category" data-hover="Category" >CATEGORY</a></li>
		  <li><a href="http://pim.local/brand" data-hover="Brand">BRAND</a></li>
		  <li><a href="http://pim.local/feedback" data-hover="Feedback">FEEDBACK</a></li>

		</ul> 
	</nav>
<!-- Style 4 End -->

<img style="display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;" src="https://fontmeme.com/permalink/210411/0fc2533f8db536aead948d90a0f41e8f.png" alt="melancholight-font" border="0" height="100px">
    
    
    
    <button onclick="location.href='http://pim.local/category?name=ASC'">Name <i class="fas fa-arrow-up"></i></button>
    <button onclick="location.href='http://pim.local/category?name=DESC'">Name <i class="fas fa-arrow-down"></i></button>
    

    
    
    <div class="info">
            <?php $this->slots()->output('_content') ?>
    </div>
    <?php 
    if($this->editmode):
       
    else: 
    
?>


<?php
    //echo "has the changes updated";
    
    //#   this is for getting the base url from the base ( but it gives back the ?page=1 also along with the url)
    
    //$var = sprintf(
    //"%s://%s%s",
    //isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http',
    //$_SERVER['SERVER_NAME'],
    //$_SERVER['REQUEST_URI']
    //                );


  //#  -----------------------------------------------------------
    $filter_url  = "http://pim.local/category?";
    $pageLimit = 3;
    $categoryData = new \Pimcore\Model\DataObject\Category\Listing();
    if(isset($_GET["name"]))
    {
        $name = $_GET["name"];
        $categoryData->setOrder($name);
        $categoryData->setOrderKey("categoryName");

        $filter_url  = "http://pim.local/category?name=".$name;
        define("FBASE", $filter_url);

        //echo $name;
    }
    //if(isset($_GET["date"]))
    //{
    //    $date = $_GET["date"];
    //    $categoryData->setOrder($date);
    //    $categoryData->setOrderKey("productLaunchDate");
    //    $filter_url  = "http://pim.local/products?date=".$date;
    //    define("FBASE", $filter_url);
    //}
    if (isset($_GET["page"])) 
    {
        $page  = $_GET["page"];        
    }    
    else
    {
        $page = 1;    
    } 
    $offset = ($page-1) * $pageLimit; 
    
    

    $categories = count($categoryData);
    $categoryData->setLimit($pageLimit);
    if($offset > 0)
    {
      $categoryData->setOffset($offset);
    }
    else
    {
      $categoryData->setOffset(0);
    }
    if(empty($categoryData))
    {
        echo "product data is empty";
    }
    foreach($categoryData as $product) 
    {

        
        
?>

<div style="height:250px; background:#94e0de; margin:10px; border-radius:15px ;opacity: 0.8;">
   <div style="width: 73%; float:left;  margin-top:2px; margin-left:10px; width:70%;">
		<h2> <?=$product->getCategoryName(); ?> </h2>
    	<h4> <?=$product->getCategoryDescription(); ?> <h4>
	</div>
    
</div>
       
<?php
    } 
?>  

<?php endif; ?>

<div class="pagination" > 

<?php
      if(!$this->editmode) {
        echo "</br>";     
        $pageCount = ceil($categories / $pageLimit);     
        $gotoPage = "";       
      
        if($page >= 2){   
            
            //echo "<a href='".FBASE."&page=".($page-1)."'>  Prev </a>";
            echo "<a href='".$filter_url."&page=".($page-1)."'>  Prev </a>";
            
        }       
                    
        for ($i = 1; $i <= $pageCount; $i++) {
              
          if ($i == $page)
          {   
              //$gotoPage.= "<a class = 'active' href='".FBASE."&page=".$i."'>".$i." </a>";
              $gotoPage.= "<a class = 'active' href='".$filter_url."&page=".$i."'>".$i." </a>";   
          }         
          else 
          {   
              //$gotoPage.= "<a href='".FBASE."&page=".$i."'>".$i." </a>";
              $gotoPage.= "<a href='".$filter_url."&page=".$i."'>".$i." </a>";     
          }

        };     
        echo $gotoPage;
        //$gotoPage ="";
            
        if($page<$pageCount){   
            //echo "<a href='".FBASE."/&page=".($page+1)."'>  Next </a>";
            echo "<a href='".$filter_url."/&page=".($page+1)."'>  Next </a>";   
        }
      }
?>    
</div>


</body>
</html>
