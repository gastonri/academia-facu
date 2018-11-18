/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validarForm() {
    for (var i = 0; i < document.forms[0].length; i++) {
        console.log(document.forms[0].elements[i]);
        switch (document.forms[0].elements[i].tagName) {
            case 'INPUT':
                if (document.forms[0].elements[i].value === '' || document.forms[0].elements[i].value === 0) {
                    document.forms[0].elements[i].setAttribute('class', 'form-control is-invalid');
                    console.log('no tiene nada')
                    return false;
                } else {
                    switch (document.forms[0].elements[i].type) {
                        case 'number':
                            if (document.forms[0].elements[i].min > document.forms[0].elements[i].value || document.forms[0].elements[i].max < document.forms[0].elements[i].value) {
                                console.log(document.forms[0].elements[i].min > document.forms[0].elements[i].value);
                                console.log(document.forms[0].elements[i].max < document.forms[0].elements[i].value);
                                document.forms[0].elements[i].setAttribute('class', 'form-control is-invalid');
                                return false;
                            } else {
                                document.forms[0].elements[i].setAttribute('class', 'form-control is-valid');
                            }
                            break;
                        case 'email':
                            var regex = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
                            if (!regex.test(document.forms[0].elements[i].value.toLowerCase())) {
                                document.forms[0].elements[i].setAttribute('class', 'form-control is-invalid');
                                return false;
                            } else {
                                document.forms[0].elements[i].setAttribute('class', 'form-control is-valid');
                            }
                            break;
                        default:
                            break;
                    }
                    if (document.forms[0].elements[i].type === 'email' && !document.forms[0].elements[i].validity.valid) {
                        document.forms[0].elements[i].setAttribute('class', 'form-control is-invalid');
                        return false;
                    } else {
                        document.forms[0].elements[i].setAttribute('class', 'form-control is-valid');
                    }
                }
                break;

            case 'SELECT':
                if (document.forms[0].elements[i].value === '') {
                    document.forms[0].elements[i].setAttribute('class', 'form-control is-invalid');
                    return false;
                } else {
                    document.forms[0].elements[i].setAttribute('class', 'form-control is-valid');
                }
                break;

            default:
                break;
        }
    }
    return true;
}
