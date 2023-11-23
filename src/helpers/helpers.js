function onlyOne(checkbox){
    var checks = document.getElementsByName('sobre')
    checks.forEach(item =>{
        if (item !== checkbox) { item.checked = false}
    })
}
function validarRut(rut) {
    // Eliminar puntos y guiones del RUT y convertir a mayúsculas
    rut = rut.replace(/\./g, '').replace('-', '').toUpperCase();

    // Verificar que el RUT tenga el formato correcto
    var rutRegExp = /^[0-9]+-[0-9kK]{1}$/;
    if (!rutRegExp.test(rut)) {
        return false;
    }

    // Separar el número y el dígito verificador
    var splitRut = rut.split('-');
    var numero = parseInt(splitRut[0], 10);
    var dv = splitRut[1];

    // Calcular el dígito verificador esperado
    var suma = 0;
    var multiplo = 2;

    for (var i = numero.toString().length - 1; i >= 0; i--) {
        suma += parseInt(numero.toString().charAt(i)) * multiplo;
        if (multiplo < 7) {
            multiplo += 1;
        } else {
            multiplo = 2;
        }
    }

    var resto = suma % 11;
    var dvEsperado = 11 - resto;

    // Si el dígito verificador es 11, se reemplaza por 0
    if (dvEsperado === 11) {
        dvEsperado = 0;
    }

    // Verificar que el dígito verificador sea válido
    if (dvEsperado !== parseInt(dv, 10)) {
        return false;
    }

    // El RUT es válido
    return true;
}


