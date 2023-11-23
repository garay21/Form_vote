<?php
include_once('./../config/config.php');

class FormModel{
    private $db;

    public function __construct(){
        
        $this->db = new Database();
    }
    public function show(){
        
        $result = $this->db->query("");
        $datos = [];

        while ($row = $result->fetch_assoc()) {
            $datos[] = $row;
        }          
        return $datos;
    }

    public function store($request) {

        //recopilacion de datos de la request obtenida
        $nmlt = $request['name-lastname']; // nombre del votante
        $alis = $request['alias']; // alias del votante
        $rut = $request['rut']; // rut del votante
        $email = $request['e-mail']; // email del votante 
        $cm = $request['comuna']; // comuna selecionada id 
        $cndt = $request['candidato']; // candidato selecionado id
        $motivo = implode(',',$request['sobre']); // motivo por el que se supo sobre la votacion
           
        try {
            $sql = "call IngresarFormulario(?,?,?,?,?,?,?);";
            $stmt = $this->db->conn->prepare($sql);
            $stmt->bind_param("ssssisi", $nmlt, $alis, $rut, $email, $cm, $motivo,$cndt);
            $stmt->execute();
            return true;
        } catch (Exception $ex) {
            return false;
        }        
    }
}
?>