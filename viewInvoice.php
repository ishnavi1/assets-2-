<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ViewInvoice</title>
    <style>
        body{
            background-color: #F6F6F6; 
            margin: 0;
            padding: 0;
        }
        h1,h2,h3,h4,h5,h6{
            margin: 0;
            padding: 0;
        }
        p{
            margin: 0;
            padding: 0;
        }
        .container{
            width: 80%;
            margin-right: auto;
            margin-left: auto;
        }
        .brand-section{
           background-color: #0d1033;
           padding: 10px 40px;
        }
        .logo{
            width: 50%;
        }

        .row{
            display: flex;
            flex-wrap: wrap;
        }
        .col-6{
            width: 50%;
            flex: 0 0 auto;
        }
        .text-white{
            color: #fff;
        }
        .company-details{
            float: right;
            text-align: right;
        }
        .body-section{
            padding: 16px;
            border: 1px solid gray;
        }
        .heading{
            font-size: 20px;
            margin-bottom: 08px;
        }
        .sub-heading{
            color: #262626;
            margin-bottom: 05px;
        }
        table{
            background-color: #fff;
            width: 100%;
            border-collapse: collapse;
        }
        table thead tr{
            border: 1px solid #111;
            background-color: #f2f2f2;
        }
        table td {
            vertical-align: middle !important;
            text-align: center;
        }
        table th, table td {
            padding-top: 08px;
            padding-bottom: 08px;
        }
        .table-bordered{
            box-shadow: 0px 0px 5px 0.5px gray;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }
        .text-right{
            text-align: end;
        }
        .w-20{
            width: 20%;
        }
        .float-right{
            float: right;
        }
    </style>
</head>
<body>

<?php $saleIdInput = $_GET['saleIdInput']; 
// echo "input id is $saleIdInput";
?>

<?php
        // Username is root
$user = 'root';
$password = '';
$database = 'shop_inventory';

// Server is localhost with
// port number 3306
$servername='localhost:3306';
$mysqli = new mysqli($servername, $user,
				$password, $database);

// Checking for connections
if ($mysqli->connect_error) {
	die('Connect Error (' .
	$mysqli->connect_errno . ') '.
	$mysqli->connect_error);
}
?>

    <div class="container">
        <div class="brand-section">
            <div class="row">
                <div class="col-6">
                    <h1 class="text-white">SHRIRAM IRRIGATION</h1>
                </div>
                <div class="col-6">
                    <div class="company-details">
                        <p class="text-white">Shriram Irrigation Equipment Company</p>
                        <p class="text-white">Aaudogik vasahat kaopargaon</p>
                        <p class="text-white">+91 8885567869</p>
                    </div>
                </div>
            </div>
        </div>

<?php
// SQL query to select data from database
$id1 = $_GET['saleIdInput']; 
$checkid = " SELECT EXISTS (SELECT CustomerID FROM sale where customerID=$id1) as `row_exists`";
$result = $mysqli->query($checkid);
$flag=0;
while($rows=$result->fetch_assoc())
				{
                    // echo $rows['row_exists'];
                    if ($rows['row_exists']==1)
                    {
                        $flag = 1;
                    }
                }

if ($flag != 1)
{
?>
<h3> <br> The Challan Number does NOT Exist ! <br> Please Check and Try Again... <br> </h3>
<?php
exit();
}


$sql = " SELECT distinct customerName, saleDate FROM sale where customerID=$id1";
$result = $mysqli->query($sql);
while($rows=$result->fetch_assoc())
				{
?>

        <div class="body-section">
        <h3 class="heading">Ordered Items</h3>
            <div class="row">
                <div class="col-6">
                    <!-- <h2 class="heading">Invoice No.: 001</h2> -->
                    <h3><p class="sub-heading">Order Date: <?php echo $rows['saleDate'];?> </p></h3>
                    <?php
                        }
                    ?> 
                </div>

                <?php
// SQL query to select data from database
$sql = " SELECT distinct fullName, email, address, mobile, city FROM customer where customerID=$id1";
$result = $mysqli->query($sql);
while($rows=$result->fetch_assoc())
				{
?>

                <div class="col-6">
                    <p class="sub-heading">Full Name: <?php echo $rows['fullName'];?> </p>
                    <p class="sub-heading">Email Address: <?php echo $rows['email'];?> </p>
                    <p class="sub-heading">Address: <?php echo $rows['address'];?> </p>
                    <p class="sub-heading">Phone Number: <?php echo $rows['mobile'];?> </p>
                    <p class="sub-heading">City: <?php echo $rows['city'];?> </p>
                </div>
                <?php
                        }
                    ?> 
            </div>
        </div>

        <div class="body-section">

        
        


<?php
// SQL query to select data from database
$sql = " SELECT * FROM sale where customerID=$id1 ";
$result = $mysqli->query($sql);
?>
<!-- HTML code to display data in tabular format -->


	<section>
		<!-- TABLE CONSTRUCTION -->
		<table border="1">
			<tr>
				<th>Item Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total</th>
			</tr>
			<!-- PHP CODE TO FETCH DATA FROM ROWS -->
			<?php
				// LOOP TILL END OF DATA
                $sum1=0;
				while($rows=$result->fetch_assoc())
				{
			?>
			<tr>
				<!-- FETCHING DATA FROM EACH
					ROW OF EVERY COLUMN -->
				<td><?php echo $rows['itemName'];?></td>
				<td><?php echo $rows['unitPrice'];?></td>
				<td><?php echo $rows['quantity'];?></td>
                <?php $total=$rows['unitPrice']*$rows['quantity']?>
				<td><?php echo $total; ?></td>
                <?php $sum1 += $total?>
			</tr>
			<?php
				}
			?>
		</table>

        <br>

        <h3 class="heading" align=right> >>> <u> Grand Total</u> : <?php echo $sum1?> </h3>

        <br>

            <h3 class="heading">Payment Mode: CASH</h3>
	</section>
        </div>

        <!-- PHP code to establish connection with the localserver -->

<?php
$mysqli->close();
?>


<br/><br/>


        <div class="body-section">
            <p>&copy; Copyright 2023 - shriram irrigation. All rights reserved. 
                <a href="http://inventorysys.in/" class="float-right">http://inventorysys.in</a>
            </p>
        </div>      
    </div>      

</body>
</html>
