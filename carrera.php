<?php

require('conexion.php');


function guardarCarrera() {
    $postdata = file_get_contents("php://input");
    $data = json_decode($postdata, true);

    // print_r($data);

    // Para guardar los datos en la tabla carrera, 
    $cn = getConexion();
    $stm = $cn->prepare("INSERT INTO carrera (nombre) VALUES (:nombre)");
    $stm->bindParam(":nombre", $data["nombre"]);
    // $data = $stm->execute();
    // echo 'guardar carrera';
}


$method = $_SERVER["REQUEST_METHOD"];

switch($method){
    case 'POST':
        guardarCarrera();
        break;
    case 'GET':
        buscarCarrera();
        break;
    case 'DELETE':
    case 'PUT':
    default:
        echo 'TO BE IMPLEMENTED';
}