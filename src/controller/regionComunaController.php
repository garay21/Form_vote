<?php

include_once('./../model/regionComunaModel.php');

$rcm = new Region_model();

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
}


?>