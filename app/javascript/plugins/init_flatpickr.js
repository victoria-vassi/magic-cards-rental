// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with our inspector.
function calendar() {
const startDateInput = document.getElementById('booking_start_date');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#card-booking-dates').dataset.unavailable)

  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
    mode: "range"
  });
  console.log(startDateInput)
};
};

export {calendar};
