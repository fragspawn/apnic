<?php

    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    header('Content-Type: application/json');

    function sanatise_input($input_string) {
        $input_string = trim($input_string);
        $input_string = htmlspecialchars($input_string, ENT_IGNORE, 'utf-8');
        $input_string = strip_tags($input_string);
        $input_string = stripslashes($input_string);
        return $input_string;
    }

    function dbConnect() {
        include 'pass.php';
        $conn = new PDO("mysql:host=localhost;dbname=apnic", 'root', $pass);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }


    function getSmData() {
        $conn = dbConnect();
        $sql = "
SELECT two AS x, sum(five) AS y
    FROM `asns`
        WHERE six > 20160101 AND six < 20161231 AND seven = 'allocated'
            GROUP BY two
                ORDER BY two";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $retVal;
    }

    function getData() {
        $conn = dbConnect();
        $sql = "
SELECT two AS 'country', three AS 'asn', six AS 'year', sum(five) AS 'Total'
    FROM `asns`
        WHERE six > 20160101 AND six < 20161231 AND seven = 'allocated'
            GROUP BY two
                ORDER BY two";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $retVal = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $retVal;
    }

    if(isset($_GET['getData'])) {
        if($_GET['getData'] == 'list') {
            $res = getData();
            echo json_encode($res, JSON_NUMERIC_CHECK);
            exit();
        }
        if($_GET['getData'] == 'smalllist') {
            $res = getSmData();
            echo json_encode($res, JSON_NUMERIC_CHECK);
            exit();
        }
    }
?>
