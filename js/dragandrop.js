$(document).ready(function () {
    // Permitir que los elementos sean soltados en el área de los nombres
    $(".name").on("dragover", function (event) {
        event.preventDefault();
    });

    // Iniciar el arrastre de un logo
    $(".logo").on("dragstart", function (event) {
        event.originalEvent.dataTransfer.setData("text", event.target.id);
    });

    // Soltar el logo en el área correspondiente
    $(".name").on("drop", function (event) {
        event.preventDefault();
        var data = event.originalEvent.dataTransfer.getData("text");
        var draggedElement = $("#" + data);
        var targetElement = $(this);

        // Verificar si el logo coincide con el nombre (comparando el atributo 'alt' con el texto del contenedor)
        if (targetElement.data("name").toLowerCase() === draggedElement.attr("alt").toLowerCase()) {
            targetElement.append(draggedElement);
            draggedElement.attr("draggable", "false");  // Deshabilitar el arrastre una vez que se coloca en su lugar
            draggedElement.css({
                "cursor": "default",
                "margin": "auto"
            });

            // Hacer visible el nombre del auto al soltarlo
            targetElement.find('span').css("visibility", "visible");
        } else {
            // Si el logo es incorrecto, muestra un mensaje de alerta usando SweetAlert
            Swal.fire({
                icon: 'error',
                title: '¡Logo incorrecto!',
                text: 'Intenta nuevamente.',
                confirmButtonText: 'Aceptar'
            });
        }
    });

    // Permitir que los logos sean soltados en la papelera
    $("#trash").on("dragover", function (event) {
        event.preventDefault(); // Necesario para permitir que se suelte en esta área
        $(this).css("background-color", "#E64545"); // Cambia el fondo cuando está encima de la papelera
    });

    // Restaurar el color del fondo de la papelera cuando el logo no esté sobre ella
    $("#trash").on("dragleave", function () {
        $(this).css("background-color", "#f1f1f1");
    });

    // Eliminar el logo cuando se suelta en la papelera
    $("#trash").on("drop", function (event) {
        event.preventDefault();
        var data = event.originalEvent.dataTransfer.getData("text");
        var draggedElement = $("#" + data);

        // Eliminar el logo
        draggedElement.remove();

        // Mostrar mensaje de confirmación con SweetAlert
        Swal.fire({
            icon: 'success',
            title: '¡Elemento eliminado!',
            text: 'El logo se ha eliminado correctamente.',
            confirmButtonText: 'Aceptar'
        });

        // Restaurar el color del fondo de la papelera
        $(this).css("background-color", "#f1f1f1");
    });
});