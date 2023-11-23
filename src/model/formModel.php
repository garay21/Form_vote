<?php
include_once('./../config/config.php');

$conn = new BDConect();

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