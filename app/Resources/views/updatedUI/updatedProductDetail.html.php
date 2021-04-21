<?php
/**
 * @var \Pimcore\Templating\PhpEngine $this
 * @var \Pimcore\Templating\PhpEngine $view
 * @var \Pimcore\Templating\GlobalVariables $app
 */

?>
<!DOCTYPE html>
<html>

<head>
    <title>HTML, CSS and JavaScript demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href='https://fonts.googleapis.com/css?family=Oswald:300' rel='stylesheet' type='text/css'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <style>
     
        /*# sourceMappingURL=mystyle.css.map */

        body {
            background: url(https://images.pexels.com/photos/371578/pexels-photo-371578.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260);
            background-size: cover;
            
        }

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
      
      .d1 {

            /* ff 3.6+ */
            background: -moz-linear-gradient(90deg, rgba(154, 154, 154, 1) 0%, rgba(81, 83, 83, 1) 11%, rgba(20, 20, 20, 1) 22%, rgba(0, 0, 0, 1) 49%, rgba(18, 18, 18, 1) 76%, rgba(98, 98, 98, 1) 92%, rgba(126, 134, 134, 1) 100%);

            /* safari 5.1+,chrome 10+ */
            background: -webkit-linear-gradient(90deg, rgba(154, 154, 154, 1) 0%, rgba(81, 83, 83, 1) 11%, rgba(20, 20, 20, 1) 22%, rgba(0, 0, 0, 1) 49%, rgba(18, 18, 18, 1) 76%, rgba(98, 98, 98, 1) 92%, rgba(126, 134, 134, 1) 100%);

            /* opera 11.10+ */
            background: -o-linear-gradient(90deg, rgba(154, 154, 154, 1) 0%, rgba(81, 83, 83, 1) 11%, rgba(20, 20, 20, 1) 22%, rgba(0, 0, 0, 1) 49%, rgba(18, 18, 18, 1) 76%, rgba(98, 98, 98, 1) 92%, rgba(126, 134, 134, 1) 100%);

            /* ie 6-9 */
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7E8686', endColorstr='#9A9A9A', GradientType=0);

            /* ie 10+ */
            background: -ms-linear-gradient(90deg, rgba(154, 154, 154, 1) 0%, rgba(81, 83, 83, 1) 11%, rgba(20, 20, 20, 1) 22%, rgba(0, 0, 0, 1) 49%, rgba(18, 18, 18, 1) 76%, rgba(98, 98, 98, 1) 92%, rgba(126, 134, 134, 1) 100%);

            /* global 94%+ browsers support */
            background: linear-gradient(90deg, rgba(154, 154, 154, 1) 0%, rgba(81, 83, 83, 1) 11%, rgba(20, 20, 20, 1) 22%, rgba(0, 0, 0, 1) 49%, rgba(18, 18, 18, 1) 76%, rgba(98, 98, 98, 1) 92%, rgba(126, 134, 134, 1) 100%);
            opacity: 0.7;

        }
      
      .d2{
          background-color: white;
          margin-top:5%;
          margin-left: 15%;
          margin-right: 15%;
          margin-bottom: 10%;
          border-radius: 9px;
          padding:20px;
          opacity:0.9;
          text-align: center;
      }

      
      
      
    </style>





</head>

<body>

<div class="d1">
    <nav class="style-4">
        <ul class="menu-4">
            <li class="current"><a href="http://pim.local/home" data-hover="HOMES">HOME</a></li>
            <li><a href="http://pim.local/products" data-hover="Product">PRODUCT </a></li>
            <li><a href="http://pim.local/category" data-hover="Category">CATEGORY</a></li>
            <li><a href="http://pim.local/brand" data-hover="Brand">BRAND</a></li>
            <li><a href="http://pim.local/feedback" data-hover="Feedback">FEEDBACK</a></li>

        </ul>
    </nav>
</div>



<


  <img src="https://fontmeme.com/permalink/210419/933a07c1f49d61b3f436d15043eb8608.png" alt="forturn-font" border="0" style="margin-left:30%;">

  <?php

    if(isset($_GET["productSKU"]))
    {
        $productSKU = $_GET["productSKU"];
    }

    $opts = array(
        'http'=>array(
          'method'=>"GET",
          'header'=>"x-api-key:1d4e9a03106f776a929d430bc2b7903c1617b958570499347231fc6d5b127729"
        )
      );

    $context = stream_context_create($opts);
    $api_url = "http://pim.local/webservice/productlistfull?productSKU=".$productSKU;

    // Open the file using the HTTP headers set above
    $file = file_get_contents($api_url, false, $context);
    $json = json_decode($file);
    $content = $json->data;
    foreach($content as $row)
    {

  ?>

<div class="d2">
<h1> product name : <?=$row->product_name?></h1>
<h3>  <?=$row->product_description?></h3>

<h3>Price :  <?=$row->product_price?></h3> 
<h3>Category : <?=$row->product_category?></h3>
<h3>Product type : <?=$row->product_type?></h3>
<h3>Brand : <?=$row->product_brand?></h3>
<h3>Colour : <?=$row->product_colour?></h3>
<h3>Launch Date : <?=$row->product_launch_date?></h3>
<h3>Airbag Count : <?=$row->product_airbag_count?></h3>
<h3>Engine : <?=$row->product_engine?></h3>
<h3>Mileage : <?=$row->product_mileage?></h3>

<?php

$productType = $row->product_type;
if($productType == "CoumbustionCar")
{
    echo "<h3> Sunroof : ".$row->product_sunroof."</h3>";
    echo "<h3> Fuel Type : ".$row->product_fuel_type."</h3>";
}
if($productType == "CombustionTruck")
{
    echo "<h3> Maximum Load Capacity : ".$row->product_max_load_capacity."</h3>";
    echo "<h3> Fuel Type : ".$row->product_fuel_type."</h3>";
    echo "<h3> Wheel Count : ".$row->product_wheel_count."</h3>";
}
if($productType == "ElectricCar")
{
    echo "<h3> Sunroof : ".$row->product_sunroof."</h3>";
    echo "<h3> Battery Capacity : ".$row->product_battery_capacity."</h3>";
}
if($productType == "ElectricTruck")
{
    echo "<h3> Maximum Load Capacity : ".$row->product_max_load_capacity."</h3>";
    echo "<h3> Wheel Count : ".$row->product_wheel_count."</h3>";
}

?>

</div>
  
<?php

    }
?>
    





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>



</body>

</html>