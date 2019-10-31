const calculatePrice = () => {

const rangeDatesInput = document.querySelector("#booking_start_date")

  if (rangeDatesInput){
    rangeDatesInput.addEventListener("change", () => {
    // have our two dates in the right format
    const endDate = new Date(rangeDatesInput.value.split(" ")[2])
    const startDate = new Date(rangeDatesInput.value.split(" ")[0])
    // getting differenec between the dates and converting into days
    const numberOfDays = parseInt((endDate-startDate) / (1000 * 60 * 60 * 24), 10);
    // getting price per day and converting to integer
    const pricePerDay = (document.querySelector("#card_price").innerText)
    const bookingTotal = numberOfDays * pricePerDay
    // showing the booking total in HTML
    const showBookingPrice = document.querySelector("#booking_js")
    if (endDate > startDate){
    showBookingPrice.innerHTML = `Numbers of days : ${numberOfDays} <br>
                                 Price per day : ${pricePerDay} $ <br>
                                 Total : ${bookingTotal} $`
    showBookingPrice.style.display = "show"
    }
    else {
    showBookingPrice.innerHTML = ` Please select two different dates`
    showBookingPrice.style.display = "show"
    }
 })
};
};

export { calculatePrice }
