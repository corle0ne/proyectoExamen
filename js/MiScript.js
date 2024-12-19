
const NameForm = document.getElementById('NameForm');
const EmailForm = document.getElementById('EmailForm');
const SelectForm = document.getElementById('SelectForm');
const DateForm = document.getElementById('DateForm');
const TextForm = document.getElementById('TextForm');
const BtnForm = document.getElementById('BtnForm');

const name = document.getElementById('name2');
const email = document.getElementById('email2');
const subject = document.getElementById('subject');
const message = document.getElementById('message');
const btn = document.getElementById('BtnForm2');

function validacionSweet() {



    var name = $("#NameForm").val();
    var email = $("#EmailForm").val();
    var select = $("#SelectForm").val();
    var date = $("#DateForm").val();
    var text = $("#TextForm").val();
    var btn = $("#BtnForm").val();
    //VALIDACIONES
    if (name.trim() === "") {
        $("#NameForm").focus();
        show_mensaje("Ingresa tu nombre", "error");
    }
    else if (email.trim() === "") {
        $("#EmailForm").focus();
        show_mensaje("Ingresa tu Email", "error");
    }
    else if (select.trim() === "") {
        $("#SelectForm").focus();
        show_mensaje("Debes Seleccionar un servicio", "error");
    }
    else if (date.trim() === "") {
        $("#DateForm").focus();
        show_mensaje("Debes seleccionar una fecha", "error");
    } else if (text.trim() === "") {
        $("#TextForm").focus();
        show_mensaje("Debes Ingresar texto", "error");
    }
    else {
        show_mensaje("Reservacion agendada", "success");
    }
}

function validacionSweet2() {

    var name = $("#name2").val();
    var email = $("#email2").val();
    var subject = $("#subject").val();
    var message = $("#message").val();
    var btn = $("#BtnForm2").val();
    //VALIDACIONES
    if (name.trim() === "") {
        $("#name2").focus();
        show_mensaje("Ingresa tu nombre", "error");
    }
    else if (email.trim() === "") {
        $("#email2").focus();
        show_mensaje("Ingresa tu Email", "error");
    }
    else if (subject.trim() === "") {
        $("#subject").focus();
        show_mensaje("Debes ingresar un asunto", "error");
    }
    else if (message.trim() === "") {
        $("#message").focus();
        show_mensaje("Debes Ingresar texto", "error");
    }
    else {
        show_mensaje("Nos pondremos en contacto contigo", "success");
    }
}

function show_mensaje(mensaje, icono) {
    Swal.fire({
        icon: icono,
        title: mensaje,
        showClass: {
            popup: 'animated fadeInDown faster'
        },
        hideClass: {
            popup: 'animated fadeOutUp faster'
        }
    });
}
BtnForm.addEventListener('click', validacionSweet);



