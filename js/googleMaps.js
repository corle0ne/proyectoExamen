$(document).ready(function () {
    obtenerUbicacion();
})

function obtenerUbicacion() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicacion, showError);

    } else {
        alert("La geolocalizacon no es soportada por este navegador")
    }
}

//funcion para mostrar la ubicacion (se es que podemos recuperarla)

function mostrarUbicacion(position) {
    console.log(position);
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;

    console.log("Latitud: " + lat + ", Longitud: " + lon);

    getLocation(lat, lon);
    initMapComponets(lat, lon);
}

function showError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("El usuario nego el permiso de ubicacion");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("La ubicacion no esta disponible");
            break;
        case error.TIMEOUT:
            alert("Se agoto el tiempo de espera");
            break;
        default:
            alert("Error desconocido: " + error.message);
            break;
    }
}

function getLocation(lat, lon) {
    const latLng = { lat: lat, lng: lon };
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ location: latLng }, function (results, status) {
        if (status === 'OK') {
            console.log(results)
            if (results[0]) {
                const direccion = results[0].formatted_address;
                document.getElementById('direccion').innerText = "Direccion: " + direccion;

            } else {
                alert("No se encontraron resultados de direccion");
            }
        } else {
            alert("Geocodificacion fallida: " + status);
        }
    })
}

function initMapComponets(lat, long) {
    const ubicacion = { lat: lat, lng: long };

    const mapa = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: ubicacion
    })

    new google.maps.Marker({
        position: ubicacion,
        map: mapa,
        title: "Ubiacion Actual"
    })

    const panorama = new google.maps.StreetViewPanorama(
        document.getElementById("street"), {
        position: ubicacion,
        pov: { heading: 90, pitch: 5 }
    })

    mapa.setStretView(panorama);
}

