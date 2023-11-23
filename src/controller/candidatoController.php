<?php

include('./../model/candidatoModel.php');

$ctn = new CandidatoModel();

if(isset($_GET['action'])){
    $action = $_GET['action'];
}
else {
    $action = 'index';
}

switch($action){
    case 'index':
        $candidatos = $ctn->show();
        break;
    case 'store':
        header("Location: /form-vot/");
        break;
   
}


?>