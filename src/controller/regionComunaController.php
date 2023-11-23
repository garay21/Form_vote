<?php

include_once('./../model/regionComunaModel.php');

$rcm = new RegionModel();

if(isset($_GET['action'])){
    $action = $_GET['action'];
}
else {
    $action = 'index';
}

switch($action){
    case 'index':
        $regiones = $rcm->show();
        break;
    case 'store':
        header("Location: /form-vot/");
        break;
    case 'getComunas':
        header('Content-Type: application/json');
        $id = $_GET['id'];
        echo json_encode($rcm->showComune($id));
        break;
}


?>