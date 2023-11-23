<?php


if(isset($_GET['action'])){
    $action = $_GET['action'];
}
else {
    $action = 'index';
}

switch($action){
    case 'index':
        
        break;
    case 'store':
        header("Location: /form-vot/");
        break;
   
}


?>