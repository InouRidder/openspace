import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

document.addEventListener('DOMContentLoaded', () => {
  flatpickr(".datepicker", {
    minDate: "today"
  })
})


