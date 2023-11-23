<?php
include_once('./../config/config.php');
include_once('./../config/constants.php');

$conn = new BDConect($serverhost,$username,$password,$database);

class Formmodel{
    public function addVoter($request){
        if($conn->connect_error){
            return 'error al conectar';
        }
        else{
            $sql = '';
            $stmt = $conn->prepare($sql);
            $stmt->bind_param('',$request);

            // Ejecutar la consulta
            $stmt->execute();
            // Cerrar la sentencia y la conexión
            $stmt->close();
            $conn->close();
        }
    }
}

?>