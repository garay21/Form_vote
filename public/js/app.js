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
    


    const rut = document.querySelector('#rut')
    const msg = document.querySelector('#msg')

    rut.addEventListener('change', ()=>{
        const value = rut.value
        if(validarRut(value)){
            msg.innerHTML = '<input class="danger" placeholder="R.U.T ingresado es valido !!" readonly>'
        }
        else{
            msg.innerHTML = '<input class="succes" placeholder="R.U.T ingresado es invalido !!" readonly>'
        }
    })
}



