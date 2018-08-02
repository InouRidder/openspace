const clientQuery = {
  initializeForm: function() {
    const form = document.getElementById('query-form');
    if (!form) return;

    this.form = form;

    this.properties = Array.from(form.querySelectorAll('#properties input'));
    this.properties.push(form.querySelector('#character_inputs select'));

    this.characterInputs = form.querySelectorAll('#character_inputs input');
    this.spaceContainer = document.getElementById('space-container');
    console.log('initialized')
    form.onchange = this.updateResults.bind(this);
  },

  updateResults: function() {
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
    this.spaceContainer.innerHTML = "";
    data.forEach(space => {
      this.spaceContainer.insertAdjacentHTML('beforeend', space.body)
    })
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
