const moment = require('moment');

const bookingController = {
  initialize: function() {
    console.log('settling in')
    this.form = document.getElementById('new_booking');

    if (!this.form) return;

    this.submitButton = this.form.querySelector('#booking-submit-button');
    this.pricePerHour = Number.parseInt(this.submitButton.dataset.price);
    this.priceBox = document.getElementById('price-box')
    this.setListeners();
  },

  setListeners: function() {
    this.submitButton.addEventListener('click', this.initiateChange.bind(this))
  },

  initiateChange: function(e) {
    e.preventDefault();
    let currentStep = e.currentTarget.dataset.step
    if (currentStep === "1") {
      this.submitForm();
    } else if (currentStep === "0") {
      this.form.addEventListener('change', this.updateUI.bind(this))
      this.priceBox.hidden = false;
      this.updateUI();
    }
  },

  updateUI: function() {
    let prices = this.calculatePrice();

    this.priceBox.querySelector('#time-price').innerHTML = prices.hourPrice
    this.priceBox.querySelector('#fee-price').innerHTML = prices.fee
    this.priceBox.querySelector('#total-price').innerHTML = prices.totalPrice
  },

  submitForm: function() {
    this.form.submit();
  },

  errors: function(error) {
    console.log(error);
  },

  calculatePrice: function() {

    function parseTime(time) {
      let times = time.split(":")
      let num = Number.parseInt(times[0])
      if (times[1].includes("3")) {
        num += 0.5
      }
      return num;
    }


    let startTime = this.form.querySelector('#booking_start_time').value;
    let endTime = this.form.querySelector('#booking_end_time').value;

    if (endTime === "" || startTime === "") {
      this.errors("either start or end time not filled in")
    }

    let startHour = parseTime(startTime)
    let endHour = parseTime(endTime)

    if (startHour > endHour) {
      this.errors("start time must be after smaller than end hour");
    }

    let totalHours = endHour - startHour

    let hourPrice = totalHours * this.pricePerHour
    let fee = hourPrice * 0.05
    let totalPrice = fee + hourPrice
    let returnValue = { fee: fee, hourPrice: hourPrice, totalPrice: totalPrice }
    return returnValue;
  }
}

export {bookingController};
