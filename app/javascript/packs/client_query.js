const clientQuery = {
  startListening: function() {
    const form = document.getElementById('query-form');
    if (!form) return;

    this.setProps(form)
    this.setListeners(form)
  },

  setListeners: function(form) {
    form.addEventListener('change', this.initiateChange.bind(this));
    form.addEventListener('submit', (e) => {
      e.preventDefault();
    });
  },

  setProps: function(form) {
    this.form = form;
    this.properties = Array.from(form.querySelectorAll('#properties input'));
    this.properties.push(form.querySelector('#character_inputs select'));

    this.characterInputs = form.querySelectorAll('#character_inputs input');
    this.spaceContainer = document.getElementById('space-container');
  },

  initiateChange: function() {
    let body = this.getFormValues();
    // let queryString = this.generateQueryString(body);
    this.submitForm(body)
    // Submit the form :)
  },

  submitForm(body) {
    fetch("/spaces", {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify({search: body}),
      method: "POST"
    })
    .then(response => {
      return response.json();
    })
    .then(data => {
      this.updateUI(data)
    })
    .catch(error => console.log(error))
  },

  updateUI: function(data) {
    // update the view using the JSON response
    console.log(data)
    global.map.removeMarkers();
    this.spaceContainer.innerHTML = "";
    let markers = [];
    data.forEach(space => {
      this.spaceContainer.insertAdjacentHTML('beforeend', space.body)
      if (space.coordinates.lat && space.coordinates.lng) {
        let marker = {
            lat: Number.parseFloat(space.coordinates.lat),
            lng: Number.parseFloat(space.coordinates.lng),
            infoWindow: space.infoWindow
          }
        global.map.addMarker(marker);
        markers.push(marker);
      }
    })

    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(markers[0].lat, markers[0].lng);
      map.setZoom(14);
    } else {
      map.fitLatLngBounds(markers);
    }

  },

  getFormValues: function() {
    let body = {properties: []}
    this.properties.forEach((input) => {
      if (input.checked || (input.type == "select-one" && input.value !== "")) {
        body.properties.push(input.value)
      }
    })
    this.characterInputs.forEach((input) => {
      body[input.dataset.name] = input.value
    })
    return body
  }
}

export {clientQuery};
