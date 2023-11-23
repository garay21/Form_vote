<?php

?>

<form action="./src/controller/formController.php?action=store" method="post">
    <label >Nombre y apellido</label>
    <input type="text" name="name-lastname" placeholder="Nombre y apellido del votante" required>
    <label >Alias</label> 
    <input type="text" name="alias" placeholder="Alias del votante" minlength="5" required>
    <label >Rut</label>
    <input type="text" name="rut" id="rut" placeholder="Rut del votante" required>
    <label >e-mail</label>
    <input type="text" name="e-mail" placeholder="e-mail del votante" required>
    <label >Region</label>
    <select name="region" id="" required>
        <option value="0">Seleccione una región</option>
    </select>  
    <label>Comuna</label>
    <select name="comuna" id="" required>
        <option value="0">Selecione una comuna</option>
    </select>
    <label >Candidato</label>
    <select name="candidato" id="candidato" required>
        <option value="0">Selecione un candidato</option>
    </select>
    <label>Como se entero de nosotros</label>
    <div class="check-content">
        <label >Web</label>
            <input type="checkbox" name="sobre" onclick="onlyOne(this)">
        <label >TV</label>
            <input type="checkbox" name="sobre" onclick="onlyOne(this)">
        <label >Redes sociales</label>
            <input type="checkbox" name="sobre" onclick="onlyOne(this)">
        <label >Amigos</label>
            <input type="checkbox" name="sobre" onclick="onlyOne(this)">
    </div>
    <button type="submit">Votar</button>
    <div class="msg" id="msg"></div>
</form>



