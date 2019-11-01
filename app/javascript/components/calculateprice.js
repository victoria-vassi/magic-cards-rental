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
    const showBookingPrice = document.querySelector("#price_days")
    if (endDate > startDate){
    showBookingPrice.innerHTML = `  Total price : <br>
                                    ${pricePerDay}€ x ${numberOfDays} days = ${(pricePerDay*numberOfDays)}€`
    showBookingPrice.classList.add("btn", "text-white", "btn-dark", "rounded", "mb-3", "text-left", "btn-outline-dark" )
    showBookingPrice.style.display = "show"
    }
    else {
    showBookingPrice.innerHTML = `Please select two different dates`
    showBookingPrice.style.display = "show"
    }
 })
};
};

export { calculatePrice }
