<?php
include_once('./../config/constants.php');

class BDConect {

    #CONN coneccion a la base de datos
    private $Conn;        

    public function __construct($serverhost,$username,$password,$database) {
       $this->Conn = new mysqli($serverhost,$username,$password,$database);
    }

    public function getConn(){
        return $this->Conn;
    }
}

?>