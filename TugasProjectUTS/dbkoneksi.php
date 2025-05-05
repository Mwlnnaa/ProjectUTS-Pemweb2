<?php
$dsn = "mysql:host=localhost;dbname=dbpuskesmas";
$dbuser = "root";
$dbpass = "";

try {
    $dbh = new PDO($dsn, $dbuser, $dbpass);
} catch (PDOException $e) {
    echo "Koneksi gagal: " . $e->getMessage();
    die();
}



// $conn = mysqli_connect("localhost", "root", "", "dbpuskesmas");

?>
