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
        body {
            font-family: 'lato', sans-serif;
        }

        .container {
            max-width: 1500px;
            margin-left: auto;
            margin-right: auto;
            padding-left: 10px;
            padding-right: 10px;
        }

        h2 {
            font-size: 26px;
            margin: 20px 0;
            text-align: center;
        }

        h2 small {
            font-size: 0.5em;
        }

        .responsive-table li {
            border-radius: 3px;
            padding: 25px 30px;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .responsive-table .table-header {
            background-color: #95A5A6;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }

        .responsive-table .table-row {
            background-color: #ffffff;
            -webkit-box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
            box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
        }

        .responsive-table .col-1 {
            -ms-flex-preferred-size: 10%;
            flex-basis: 20%;
        }

        .responsive-table .col-2 {
            -ms-flex-preferred-size: 40%;
            flex-basis: 20%;
        }

        .responsive-table .col-3 {
            -ms-flex-preferred-size: 25%;
            flex-basis: 15%;
        }

        .responsive-table .col-4 {
            -ms-flex-preferred-size: 25%;
            flex-basis: 25%;
        }
        

        @media all and (max-width: 867px) {
            .responsive-table .table-header {
                display: none;
            }

            .responsive-table li {
                display: block;
            }

            .responsive-table .col {
                -ms-flex-preferred-size: 100%;
                flex-basis: 100%;
            }

            .responsive-table .col {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                padding: 10px 0;
            }

            .responsive-table .col:before {
                color: #6C7A89;
                padding-right: 10px;
                content: attr(data-label);
                -ms-flex-preferred-size: 50%;
                flex-basis: 50%;
                text-align: right;
            }
        }

        /*# sourceMappingURL=mystyle.css.map */

        body {
            background: url(https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500);
            background-size: cover;
            background-position: center;
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


        .pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  background-color: white;
  border-radius: 5px;
  margin:3px;
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
      
.paginaiton_block{
    margin-left: 20%;
    
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



<div class="dropdown" style="margin-top:10%; margin-left:13.5%; float: left;">
    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="padding: 12px; font-size: 15px; border-radius:8px;">
      Sort By
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="padding: 10px; font-size: 20px;">
      <li><a class="dropdown-item" href="http://pim.local/nproduct?name=ASC">Name <i class="fas fa-arrow-up"></i></a></li>
      <li><a class="dropdown-item" href="http://pim.local/nproduct?name=DESC">Name <i class="fas fa-arrow-down"></i></a></li>
      <li><a class="dropdown-item" href="http://pim.local/nproduct?date=ASC">Launch Date <i class="fas fa-arrow-up"></i></a></li>
      <li><a class="dropdown-item" href="http://pim.local/nproduct?date=DESC">Launch Date <i class="fas fa-arrow-down"></i></a></li>
    </ul>
  </div>


  <img src="https://fontmeme.com/permalink/210419/62d1d2cc13841d4dd2e4ae5f581a19a1.png" alt="forturn-font" border="0" style="margin-top: 7%; margin-left: 10%;">



  <div style="float: right; margin-top:10%; margin-right: 12%;">
      
    <form method="get" action="/nproduct">
        <input type="text" id="search" name="search" placeholder="search..."  size="50" style="padding: 10px; font-size: 12px; border-radius: 8px;">
        <button type="submit" style="padding: 10px; font-size: 12px; border-radius: 8px; margin-left:4px; background-color: green; color:white;" >search
        </button>
        </form>
  </div>

  

    <div class="container" style="margin-top: 5%;">
        <ul class="responsive-table">
            <li class="table-header">
                <div class="col col-1"><strong>Name</strong></div>
                <div class="col col-2"><strong>Category</strong></div>
                <div class="col col-3"><strong>Price</strong></div>
                <div class="col col-4"><strong>Product Type</strong></div>
            </li>

            <?php
                $opts = array(
                    'http'=>array(
                      'method'=>"GET",
                      'header'=>"x-api-key:1d4e9a03106f776a929d430bc2b7903c1617b958570499347231fc6d5b127729"
                    )
                  );

                $context = stream_context_create($opts);
                
                $pageLimit = 3;
                $filter_url = "http://pim.local/nproduct?";
                $base_url = "http://pim.local/webservice/productlistfull?";

                if (isset($_GET["page"])) 
                {
                    $page  = $_GET["page"];        
                }    
                else
                {
                    $page = 1;    
                }

                if(isset($_GET["name"]))
                {
                    $name = $_GET["name"];
                    $base_url = $base_url."&name=".$name;
                    $filter_url  = "http://pim.local/nproduct?name=".$name;
                }
                if(isset($_GET["date"]))
                {
                    $date = $_GET["date"];
                    $base_url =$base_url."&date=".$date;
                    $filter_url  = "http://pim.local/nproduct?date=".$date;
                }
                if(isset($_GET["search"]))
                {
                    $search = $_GET["search"];
                    //$temp = $search."%";
                    $base_url =$base_url."&search=".$search;
                    //$productData->setCondition("lower(productName) LIKE ?",["$temp"]);
                    $filter_url  = "http://pim.local/nproduct?search=".$search;
                    
                }

                $offset = ($page-1) * $pageLimit; 

                //$total_products = count($products);
                
                if($offset <= 0)
                {
                  $offset = 0;
                }
                
                $api_url = $base_url."&offset=".$offset."&limit=".$pageLimit;

                // Open the file using the HTTP headers set above
                $file = file_get_contents($api_url, false, $context);
                $json = json_decode($file);
                $content = $json->data;
                $total_products = $json->total_products;
                $pageLimit = $json->pageLimit;
                foreach($content as $row)
                {
                    

            ?>
            <li class="table-row">
                <div class="col col-1" data-label="Product Name"><?=$row->product_name; ?></div>
                <div class="col col-2" data-label="Product Category"><?=$row->product_category; ?></div>
                <div class="col col-3" data-label="Product Price"><?=$row->product_price; ?></div>
                <div class="col col-4" data-label="Product Type"><?=$row->product_type; ?> <a class="btn btn-primary" href="<?php echo 'http://pim.local/nproduct_detail?productSKU='.$row->product_SKU; ?>" role="button" style="float:right;">View</a></div>
            </li>
            <?php
                }

            ?>

        </ul>
    </div>
<div class="paginaiton_block">
    <div class="pagination" > 

<?php


      if(!$this->editmode) {
        echo "</br>";  

        $pageCount = ceil($total_products / $pageLimit);    
        
        $gotoPage = "";   

        if($page >= 2){   
               
            echo "<a href='".$base_url."&page=".($page-1)."'>  Prev </a>";
            
        }       
                    
        for ($i = 1; $i <= $pageCount; $i++) {
              
          if ($i == $page)
          {   
              $gotoPage.= "<a class = 'active' href='".$filter_url."&page=".$i."'>".$i." </a>";   
          }         
          else 
          {   
              $gotoPage.= "<a href='".$filter_url."&page=".$i."'>".$i." </a>";     
          }

        };     
        echo $gotoPage;
        
            
        if($page<$pageCount){   
            echo "<a href='".$filter_url."/&page=".($page+1)."'>  Next </a>";   
        }
      }
?>    
</div>

</div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>



</body>

</html>