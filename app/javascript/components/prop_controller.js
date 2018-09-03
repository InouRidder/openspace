const propController = {
  initialize: function() {
    this.properties = document.getElementById('properties');
    if (!this.properties) return;
    this.props = properties.querySelectorAll('.selectable-prop');
    this.setListeners();
  },

  setListeners: function() {
    this.props.forEach(prop => {
      prop.addEventListener('click', this.toggleProp.bind(this))
    })
  },

  toggleProp: function(e) {
    let prop = e.currentTarget;
    let input = prop.parentElement.querySelector('input');
    this.toggleClass('ti-check-box ti-layout-width-full', prop)
    this.toggleInput(input);
  },

  toggleInput: function(input) {
    input.checked = !input.checked
  },

  toggleClass: function(classes, element) {
    classes.split(" ").forEach(elementClass => {
      element.classList.toggle(elementClass)
    })
  }
}

export { propController };



