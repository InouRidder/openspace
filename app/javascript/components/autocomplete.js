function autocomplete() {
  document.addEventListener("turbolinks:load", function() {
    var spaceAutocomplete = document.getElementById('space_address_autocomplete');

    if (spaceAutocomplete) {
      var autocomplete = new google.maps.places.Autocomplete(spaceAutocomplete, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(spaceAutocomplete, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
