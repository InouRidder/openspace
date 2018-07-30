const clientQuery = {
  initializeForm: function() {
    const form = document.getElementById('query-form');
    if (!form) return;
    console.log('Initialized !')
    this.form = form;
    this.properties = form.querySelectorAll('#properties input');
    this.characterInputs = form.querySelectorAll('#character_inputs input');
    this.spaceContainer = document.getElementById('space-container');
    form.onchange = this.updateResults.bind(this);
  },

  updateResults: function() {
    let body = this.getFormValues();
    // let queryString = this.generateQueryString(body);
    this.submitForm(body)
    // Submit the form :)
  },

  generateQueryString: function(body) {
    return Object.keys(body).map(key => {
      return `${key}=${body[key]}`
    }).join("&")
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
    this.spaceContainer.innerHTML = "";
    data.forEach(space => {
      this.spaceContainer.insertAdjacentHTML('beforeend', space.body)
    })
  },

  getFormValues: function() {
    let body = {properties: []}
    this.properties.forEach((input) => {
      if (input.checked) {
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
