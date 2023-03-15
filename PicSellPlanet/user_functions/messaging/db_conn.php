<?php 

# server name
$sName = "localhost";
# user name
$uName = "u953367191_picsellplanet";
# password
$pass = "Picsellplanet123@";

# database name
$db_name = "u953367191_picsellplanet";

#creating database connection
try {
    $conn = new PDO("mysql:host=$sName;dbname=$db_name", 
                    $uName, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
  echo "Connection failed : ". $e->getMessage();
}