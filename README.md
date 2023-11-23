# Formulario para omitir votos

<p>
    aplicaion web para omitir votos a los canditatos propuestos por alguna entidad.
</P>

# iniciar aplicacion 

<p> Para poder instalar o ver la aplicacion debemos de depositarla en algun servidor web, XAMP o algun
otro igual, agregar el proyecto a la raiz y abrirlo por la url.</p>

## Formulario Voto

<ul>
    <li>Nombre y apellidos validados que no esten en blanco.</li>
    <li>Alias no menor a 5 caracteres y debe contener almenos letras y numeros.</li>
    <li>RUT validado para formato chileno.</li>
    <li>regiones cargadas desde la base de datos.</li>
    <li>comunas cargadas segun region selecionada.</li>
    <li>candidatos cargados desde la base de datos.</li>
    <li>motivo al menos se pueden marcar mas de dos.</li>
</ul>
<p>según las validaciones guarda el voto y el votante en la base de datos, de ya existir el rut del votante no se agrega y avisa que ya existe.</p>

## Conección a la base de datos

<p> para conectar a la base de datos debemos de dirijirnos a la siguiente ruta /src/config/config.php
en este archivo tenemos definidos las variables de conección(trabajamod con mysqli), donde podemos cambiarlas según vuestras credenciales.
</p>

## lenguajes

PHP 8.1.12
JavaScript.
xamp server. v.3.3.0 
