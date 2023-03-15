<?php  

session_start();

define('TIMEZONE', 'Asia/Manila');
date_default_timezone_set(TIMEZONE);

$date = date("Y-m-d H:i:s");

# check if the user is logged in
if (isset($_SESSION['login_user_id'])) {
	
	# database connection file
	include '../db_conn.php';

	# get the logged in user's username from SESSION
	$id = $_SESSION['login_user_id'];

	$sql = "UPDATE tbl_user_account
	        SET user_last_seen = ?
	        WHERE user_id = ?";
	$stmt = $conn->prepare($sql);
	$stmt->execute([$date, $id]);

}else {
	header("Location: ../../index.php");
	exit;
}