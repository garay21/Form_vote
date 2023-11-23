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
});

function main(){
    const rut = document.querySelector('#rut')
    const msg = document.querySelector('#msg')

    rut.addEventListener('change', ()=>{
        const value = rut.value
        if(validarRut(value)){
            msg.innerHTML = '<p class="danger"> R.U.T ingresado es valido !!<p>'
        }
        else{
            msg.innerHTML = '<p class="succes"> R.U.T ingresado invalido !!<p>'
        }
    })
}



