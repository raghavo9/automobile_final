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

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.alert {
  
  background-color: #f44336;
  color: white;
}
.alert_green {
  
  background-color: #22d628;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
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
  width: 50%;" src="https://fontmeme.com/permalink/210412/a9b43587fe53a4e7d0811f6e7ae194b3.png" alt="melancholight-font" border="0" height="100px">
    
    
    
    

    
    
    <div class="info">
            <?php $this->slots()->output('_content') ?>
    </div>
    <?php 
    if($this->editmode):
       
    else: 
    
?>



<div class="container">
  <form method="post" action="/feedback">
    <label for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name..">

    <label for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name..">

    <label for="email">Email</label>
    <input type="text" id="email" name="email" placeholder="Your Email..">

    <label for="feedback">Feedback</label>
    <input type="text" id="feedback" name="feedback" placeholder="Your feedback..">

    <input type="submit" name ="sub" value="Submit">
  </form>
</div>








<?php endif;
            
?>

<?php

$err_msg = "";

if(isset($_POST['sub']) and $_POST['sub'])
{
	
	if(isset($_POST['firstname']) and $_POST['firstname']==""){
		$err_msg = $err_msg."first name not Provided<br />";
	}
	if(isset($_POST['lastname']) and $_POST['lastname']==""){
		$err_msg = $err_msg."last name not Provided<br />";
    }
    if(isset($_POST['feedback']) and $_POST['feedback']==""){
		$err_msg = $err_msg."feedback not Provided<br />";
    }
    if(isset($_POST['email']) && !empty($_POST['email'] ))
    {
        $str=$_POST["email"];
        if (!preg_match("/^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$/", $str))
        {
            $err_msg = $err_msg."invalid email type ";
        }
    }
    else
    {
        $err_msg = $err_msg."email is not provided<br />";
    }
    if(!$err_msg)
    {
        // key = firstname + uniqueid()
        $key = $_POST["firstname"].uniqid();
        $parentid = 65;

        $cdate=date_create()->format('d-m-Y');
        $ndate = new DateTime($cdate);
        $obj = new \Pimcore\Model\DataObject\Feedback();
        $fname = $_POST["firstname"];
        $lname = $_POST["lastname"];
        $email = $_POST["email"];
        $feedback = $_POST["feedback"];
        $obj->setKey($key);
        $obj->setParentId($parentid);
        $obj->setPublished(true);
        $obj->setFirstName($fname);
        $obj->setLastName($lname);
        $obj->setEmail($email);
        $obj->setFeedbackText($feedback);
        $obj->setCreatedAt($ndate);
        $obj->save();

        echo "<div class=\"alert_green\"> <span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\">&times;</span> feedback submited successfuly</div>";
    }
    else
    {
        echo "<div class=\"alert\"> <span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\">&times;</span> ".$err_msg."</div>";
    }
}
    

?>

</body>
</html>
