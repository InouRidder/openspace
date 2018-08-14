const spaceQuery = {
  startListening: function() {
    const form = document.getElementById('query-form');
    if (!form) return;

    this.setProps(form)
    this.setListeners(form)
  },

  toggleFilter: function(event) {
    event.preventDefault();
    let direction = event.currentTarget.dataset.hidden
    if ( direction === 'hidden' ) {
      event.currentTarget.dataset.hidden = 'display';
      event.currentTarget.innerHTML = 'Less filters';
      this.filterContainer.hidden = false;
    } else {
      event.currentTarget.dataset.hidden = 'hidden';
      event.currentTarget.innerHTML = 'More filters';
      this.filterContainer.hidden = true;
    }
  },


  setListeners: function(form) {
    form.addEventListener('change', this.initiateChange.bind(this));
    this.filterButton.addEventListener('click', this.toggleFilter.bind(this));
    form.addEventListener('submit', (e) => {
      e.preventDefault();
    });
  },

  setProps: function(form) {
    this.form = form;
    this.properties = Array.from(form.querySelectorAll('.property'));
    this.characterInputs = form.querySelectorAll('.text-input');

    this.resultCount = document.getElementById('result-count');
    this.filterContainer = document.getElementById('filter-container');
    this.filterButton = document.getElementById('more-filters');
    this.capacityForm = form.querySelector('#search_capacity');
    this.priceForm = form.querySelector('#search_price_per_hour');
    this.spaceContainer = document.getElementById('space-container');
  },

  initiateChange: function() {
    let body = this.getFormValues();
    // let queryString = this.generateQueryString(body);
    this.submitForm(body)
    // Submit the form :)
  },

  submitForm(body) {
    // TO DO: CHANGE THIS TO A GET REQUEST
    fetch("/spaces/query", {
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
    global.map.removeMarkers();
    this.spaceContainer.innerHTML = data.spaces_html;
    let markers = JSON.parse(data.markers);
    this.resultCount.innerHTML = markers.length;

    markers.forEach(marker => {
      global.map.addMarker(marker);
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
  return body;
  }
}

export {spaceQuery};
