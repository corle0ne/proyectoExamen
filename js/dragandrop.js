const cars = document.querySelectorAll('.car');
const parkingSlots = document.querySelectorAll('.parking-slot');
const deleteZone = document.querySelector('.delete-zone');

cars.forEach(car => {
    car.addEventListener('dragstart', dragStart);
    car.addEventListener('dragend', dragEnd);
});

parkingSlots.forEach(slot => {
    slot.addEventListener('dragover', dragOver);
    slot.addEventListener('dragenter', dragEnter);
    slot.addEventListener('dragleave', dragLeave);
    slot.addEventListener('drop', drop);
});

deleteZone.addEventListener('dragover', dragOver);
deleteZone.addEventListener('dragenter', dragEnterDelete);
deleteZone.addEventListener('dragleave', dragLeaveDelete);
deleteZone.addEventListener('drop', deleteItem);

function dragStart(e) {
    const car = e.target;
    e.dataTransfer.setData('id', car.id || Math.random().toString(36).substr(2, 9));
    car.classList.add('dragging');
}

function dragEnd(e) {
    e.target.classList.remove('dragging');
}

function dragOver(e) {
    e.preventDefault();
}

function dragEnter(e) {
    if (e.target.classList.contains('parking-slot')) {
        e.target.classList.add('over');
    }
}

function dragLeave(e) {
    if (e.target.classList.contains('parking-slot')) {
        e.target.classList.remove('over');
    }
}

function drop(e) {
    e.preventDefault();
    const carId = e.dataTransfer.getData('id');
    const car = document.querySelector(`#${carId}`);

    // Elimina el auto al soltarlo en cualquier zona
    if (car) {
        car.remove();
    }

    e.target.classList.remove('over');
}

function dragEnterDelete(e) {
    if (e.target === deleteZone) {
        e.target.classList.add('over');
    }
}

function dragLeaveDelete(e) {
    if (e.target === deleteZone) {
        e.target.classList.remove('over');
    }
}

function deleteItem(e) {
    e.preventDefault();
    const carId = e.dataTransfer.getData('id');
    const car = document.querySelector(`#${carId}`);
    if (car) {
        car.remove();
    }
    deleteZone.classList.remove('over');
}