<?php

include_once('./../model/formModel.php');
session_start();

$frm = new FormModel();

if(isset($_GET['action'])){
    $action = $_GET['action'];
}
else {
    $action = 'index';
}

switch($action){
    case 'store':        
        $result = true;
        $message = '';
        $request = $_POST;

        if($request['validate'] == 0){
            $message = $message.'R.U.T no valido ingrese uno valido, '; 
            $result = false;          
        }

        // validaciones de datos para ser eniado a la base de datos
        $nmlt = $request['name-lastname'];
        $alis = $request['alias'];
        $rut = $request['rut'];
        $email = $request['e-mail'];
        $cm = $request['comuna'];
        $cndt =  implode(' - ',$request['sobre']);

        //Validacion que el nombre y el apellido con esten en blanco
        if(mb_strlen($nmlt) < 5){
            $message = $message.'nombre en blanco ingrese uno valido, ';     
            $result = false;        
        }

        //validacion que el alias contenga almenos 5 caracteres y numero o letras
        if(!mb_strlen($alis) > 5 || !preg_match('/^[a-zA-Z0-9]+$/', $alis)){
            $message = $message.'el alias debe de ser alñ menos mas de 5 caracteres , ';   
            $result = false;            
        }
        
        echo json_encode($request);
        echo $message;
      
        if($result){
            echo '<h1>succes</h1>';
            $req = $frm->store($request);   
            echo $req;
            if ($req) {
                $message = $message.'Agregado correctamente';          
            }        
            else {
                $message = $message.'voto no agregado rut ya existente !!';        
            }                
        }     
        echo $message;
        $_SESSION['msg'] = $message;
        //header("Location: /form-vot/");
       
        break;
}

?>
