<html>
<head>
<title>
Customer Orders for Specified Sales Rep
</title>
</head>
<body>
	<?php
		$rep_name = $_POST['repName'];
		$min_amount = $_POST['orderTotal'];
/* Connecting to database*/
		$con = mysqli_connect('localhost', 'root', '', 'sales');
/*Code to return the results from data entered from user on CustomerOrder.html*/
	$query = "SELECT customer.custNumber, orderline.orderNum, sum(numOrdered*quotedPrice) 
		FROM customer, orders, orderline, slsrep
		WHERE customer.custNumber = orders.custNum
			AND orders.orderNum = orderline.orderNum
			AND slsrep.repNum = customer.repNum
			AND repName = '".$rep_name."'
		GROUP BY orderline.orderNum
		HAVING sum(numOrdered*quotedPrice) >= ".$min_amount."";
/*Store query results to process to webpage*/
	$results = mysqli_query($con, $query);
/*Print results to display on webpage. $row is the name of array containing the previous query results*/
While ($row = mysqli_fetch_array($results))
	{
	Echo "Customer Number – " .$row['custNumber']. "<br/>";
	Echo "Order Number – ".$row['orderNum']. "<br/>";
	Echo "Total Amount - $".$row['sum(numOrdered*quotedPrice)']. "<br/><br/>";
		}
	?>
</body>
</hmtl>
