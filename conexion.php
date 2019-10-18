<?php
function getConexion(){
    try {
        $pdo = new \PDO("mysql:host=localhost;dbname=escuela", "root", "password");
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    }catch (PDOException $e){
        print_r($e);
        return null;
    }
}