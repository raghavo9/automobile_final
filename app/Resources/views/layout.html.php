<?php
/**
 * @var \Pimcore\Templating\PhpEngine $this
 * @var \Pimcore\Templating\PhpEngine $view
 * @var \Pimcore\Templating\GlobalVariables $app
 */ 
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


    <div class="info">
            <?php $this->slots()->output('_content') ?>
    </div>
 

</body>
</html>