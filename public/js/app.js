const App = document.querySelector('#app')

// Al iniciar la aplicacion se hace un fetch con ajax para 
// pedir los datos del formulario y unirlos a la app

document.addEventListener("DOMContentLoaded", function(){
    fetch('./src/view/formulario.php')
    .then(Response => Response.text())
    .then(element => {
        App.innerHTML = element
    }).finally(()=>{
        main()
    })
    .catch(error => console.log(error))
});

function main(){
    rutAuth()
    comunaChange()    
}

// funcion para verficar siel rut ingresado es chileno
function rutAuth(){
    const rut = document.querySelector('#rut')
    const msg = document.querySelector('#msg')
    rut.addEventListener('change', ()=>{
        const value = rut.value
        if(validarRut(value)){
            msg.innerHTML = '<input class="succes" name="validate" value="1" placeholder="R.U.T ingresado es valido !!" readonly>'
        }
        else{
            msg.innerHTML = '<input class="danger" name="validate" value="0" placeholder="R.U.T ingresado es invalido !!" readonly>'
        }
    })
}

//funcion para cambiar de forma dinamica las comunas segun que region 
//se ha elegido 
function comunaChange(){
    const reg = document.querySelector('#region')
    const com = document.querySelector('#comuna')  

    reg.addEventListener('change', ()=>{
        const regId = reg.value
        
        //hacemos este fecth para solicitar los datos de las comunas segun se selecione una region
        //guardamos la id de la region y la agregamos a la url para utilizarla y pedir los datos 
        //correspondientes de la base de datos.
        fetch('./src/controller/regionComunaController.php?action=getComunas&id='+regId)
        .then(response => {
            // Verificar si la solicitud fue exitosa (código de respuesta en el rango 200)
            if (!response.ok) {
                throw new Error('Error en la solicitud: ' + response.statusText);
            }
            // Parsear la respuesta como JSON
            return response.json();
        })
        .then(data => {
            // Procesar los datos recibidos              
            var html = '<option value="">Selecione una comuna</option>'
            data.map(item =>{
                html += '<option value="'+item.commune_id+'">'+item.commune_name+'</option>'
            })   
            com.innerHTML = html
        })
        .catch(error => {
            // Manejar errores de la solicitud
            console.error('Error en la solicitud:', error);
        });
    })
}



