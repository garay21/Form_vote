<?php

include_once('./../model/formModel.php');

$frommodel = new FormModel();

$action = $_GET['action'];

switch($action){
      case 'store':
            header("Location: /form-vot/");
            break;
}


?>
