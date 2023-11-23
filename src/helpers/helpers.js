function onlyOne(checkbox){
    var checks = document.getElementsByName('sobre')
    checks.forEach(item =>{
        if (item !== checkbox) { item.checked = false}
    })
}
function validarRut(rut) {
    const dv = (T) =>{
        var M=0,S=1;
		for(;T;T=Math.floor(T/10))
			S=(S+T%10*(9-M++%6))%11;
		return S?S-1:'k';
    }
    
    if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rut ))
        return false;
    var tmp 	= rut.split('-');
    var digv	= tmp[1]; 
    var rut 	= tmp[0];
    if ( digv == 'K' ) digv = 'k' ;
    return (dv(rut) == digv );
}


