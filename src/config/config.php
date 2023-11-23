<?php
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'password');
define('DB_NAME', 'bd_votaciones'); 

class Database {

    #CONN coneccion a la base de datos
    protected $Conn;        

    public function __construct() {
       $this->conectar();
    }

    private function conectar() {
        $this->conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

        if ($this->conn->connect_error) {
            die("Conexión fallida: " . $this->conn->connect_error);
        }
    }

    public function Query($sql) {
        $result = mysqli_query($this->conn, $sql);
        return $result;
    }

    public function getConn(){
        return $this->Conn;
    }
}

?>