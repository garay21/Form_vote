const App = document.querySelector('#app')

// Al iniciar la aplicacion se hace un fetch con ajax para 
// pedir los datos del formulario y unirlos a la app

document.addEventListener("DOMContentLoaded", function(){
    fetch('./../../src/view/formulario.php')
    .then(Response => Response.text())
    .then(element => {
        App.innerHTML = element
    }).finally(()=>{
        
    })
});



