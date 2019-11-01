function setConfirmation() {

	const cards = document.querySelectorAll(".card-trip-selectable");
	const button = document.getElementById("add-to-card");
	const nameList = document.getElementById("name-list");
	const datesRange = document.getElementById("dates_range")
	const totalPriceTag = document.getElementById("total-price")
  const totalPricePreviewTag = document.getElementById("total-price-preview")

	function calculateDays() {
	  const endDate = new Date(datesRange.value.split(" ")[2])
	  const startDate = new Date(datesRange.value.split(" ")[0])
	  const numberOfDays = parseInt((endDate-startDate) / (1000 * 60 * 60 * 24), 10);
	  return numberOfDays
	};

	function calculateSum(numberOfDays) {
		var totalPrice = 0;
		const selectedCards = document.querySelectorAll(".card-selected");
	  selectedCards.forEach((card) => {
	    var price = card.children[1].children[1].children[0].innerHTML;
	    totalPrice += price * numberOfDays;
	  });
	  return totalPrice;
	};

  if (button) {
  	button.addEventListener("click", (event) => {
  	  nameList.innerText = "";
  	  const selectedCards = document.querySelectorAll(".card-selected");
  	  selectedCards.forEach((card) => {
  	  	console.log(selectedCards)
  	    var name = card.children[1].children[0].children[0].innerText
  	    nameList.insertAdjacentHTML("beforeend", `<p>${name}</p>`);
  	  });
  	  const numberOfDays = calculateDays();
  	  const totalPrice = calculateSum(numberOfDays);
  	  totalPriceTag.innerText = `€ ${totalPrice}`
  	});
  }


  if (cards) {
  	cards.forEach((card) => {
  	  card.addEventListener("click", (event) => {
  		  const numberOfDays = calculateDays();
  		  const totalPrice = calculateSum(numberOfDays);
  		  totalPricePreviewTag.innerText = `(€ ${totalPrice} total)`
  	  });
  	});
  }

};

export { setConfirmation };
