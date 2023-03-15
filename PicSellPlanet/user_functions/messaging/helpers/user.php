<?php  

define('TIMEZONE', 'Asia/Manila');
date_default_timezone_set(TIMEZONE);

function getUser($useremail, $conn){
   $sql = "SELECT * FROM tbl_user_account 
           WHERE user_archive_status = 1 AND user_id=?";
   $stmt = $conn->prepare($sql);
   $stmt->execute([$useremail]);

   if ($stmt->rowCount() === 1) {
   	 $user = $stmt->fetch();
   	 return $user;
   }else {
   	$user = [];
   	return $user;
   }
}