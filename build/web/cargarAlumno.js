/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//function validarForm() {
//    var legajo = validarLegajo();
//
//    if (legajo) {
//        document.getElementById('guardar').disabled = false;
//    } else {
//        document.getElementById('guardar').disabled = true;
//    }
//}
//
//function validarLegajo() {
//    var campo = document.getElementById('legajoAlumno').value;
//    var noti = document.getElementById('notiLegajo');
//    if (campo.value <= 0 || campo.value > 10 || !Number.isInteger(campo)) {
//        console.log(campo);
//        console.log(Number.isInteger(campo));
//        noti.style.display = "block";
//        return false;
//    } else {
//        noti.style.display = "none";
//        return true;
//    }
//}
//
//function bloquearBoton() {
//    if (error('legajoAlumno', 'notiLegajo')) {
//        document.getElementById('guardar').disabled = true;
//    } else {
//        document.getElementById('guardar').disabled = false;
//    }
//}