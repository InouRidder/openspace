const clientQuery = {
  initializeForm: function() {
    const form = document.getElementById('query-form');
    if !(form) return;
    form.addEventListener('onchange', this.submitForm);
  }

  submitForm: function(e) {
    console.log('submitted!')
  }

  updateUI: function(data) {
    // update the view using the JSON response
  }

}

export clientQuery;
