<?php

require('conexion.php');

function buscarMateria(){
    $cn = getConexion();
    $stm = $cn->query("SELECT * FROM materia");
    $rows = $stm->fetchAll(PDO::FETCH_ASSOC);
    
    $data = [];
    foreach($rows as $row){
        $data[]= [
            "id" =>$row["id"],
            "nombre" => $row["nombre"],
            "credito" => $row["credito"]

        ];
        
    }
    header("Content-Type →application/json; charset=utf-8");
    //header("Content-type: application/json", true);
    $data = json_encode($data);
    echo $data;
   
}

function guardarMateria(){
    $postdata = file_get_contents("php://input");
    $data = json_decode($postdata, true);

    $cn = getConexion();
    $stm = $cn->prepare("INSERT INTO materia (nombre, credito) VALUES (:nombre, :credito)");
    $stm->bindParam(":nombre", $data['nombre']);
    $stm->bindParam(":credito", $data['credito']);
    $data = $stm->execute();
    echo 'Carrera Guardada!';
    header("Content-Type →application/json; charset=utf-8");
    //header("Content-type: application/json", true);
}

 
$method = $_SERVER["REQUEST_METHOD"];
switch($method){
    case 'POST':
        guardarMateria();
        break;
    case 'GET':
        buscarMateria();
        break;
    case 'DELETE':
    case 'PUT':
    default:
        echo 'TO BE IMPLEMENTED';
}
