function interest(e) {
    e.currentTarget.classList.toggle("selected");
}

function populate_interests() {
    var parent = document.getElementById("interests_update");

    // Get all interest_item and create hidden input field in the form
    const items = document.getElementsByClassName("interest_item");
    for (var i = 0; i < items.length; i++) {
        if (items[i].classList.contains('selected')) {
            var input = document.createElement("input");
            input.type = 'hidden';
            input.name = 'interests[]'
            input.value = items[i].id
            parent.appendChild(input);
        }
    }
}