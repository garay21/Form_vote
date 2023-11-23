<?php
    include('./../controller/regionComunaController.php');
    include('./../controller/candidatoController.php');
    session_start();
?>
<form action="./src/controller/formController.php?action=store" method="post">
    <label >Nombre y apellido</label>
    <input type="text" name="name-lastname" placeholder="Nombre y apellido del votante" required>
    <label >Alias (ejemplo user123)</label> 
    <input type="text" name="alias" placeholder="Alias del votante" minlength="5" required>
    <label >Rut (formato sin punto y guion : 11222333-4)</label>
    <input type="text" name="rut" id="rut" placeholder="Rut del votante" required>
    <label >e-mail</label>
    <input type="text" name="e-mail" placeholder="e-mail del votante" required>
    <label >Region</label>
    <select name="region" id="region" required>
        <option value="">Seleccione una región</option>
        <?php
            foreach ($regiones as $item) {         
                echo '<option value="'.$item['region_id'].'">'.$item['region_name'].'</option>';
            }
        ?>
    </select>  
    <label>Comuna</label>
    <select name="comuna" id="comuna" required>
        <option value="">Selecione una comuna</option>
    </select>
    <label >Candidato</label>
    <select name="candidato" id="candidato" required>
        <option value="">Selecione un candidato</option>
        <?php
            foreach ($candidatos as $item) {         
                echo '<option value="'.$item['id_candidato'].'">'.$item['nombre'].'</option>';
            }
        ?>
    </select>
    <label>Como se entero de nosotros</label>
    <div class="check-content">
        <label >Web</label>
            <input type="checkbox" name="sobre[]" value="web" >
        <label >TV</label>
            <input type="checkbox" name="sobre[]" value="TV" >
        <label >Redes sociales</label>
            <input type="checkbox" name="sobre[]" value="redes sociales" >
        <label >Amigos</label>
            <input type="checkbox" name="sobre[]" value="amigos" >
    </div>
    <button type="submit">Votar</button>
    <div class="msg" id="msg"></div>
    <div class="validate" id="validate">
        <?php
            if (isset($_SESSION['msg'])) {
                echo '<p>'.$_SESSION['msg'].'</p>';
            }
        ?>
    </div>
</form>



