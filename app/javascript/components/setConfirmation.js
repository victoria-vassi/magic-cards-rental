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

	  var idList = []
		selectedCards.forEach((card) => {
		  var id = card.id
		  idList.push(id);
		});
	  console.log(idList.join(" "));

	  const card = document.querySelector("#cards")
	  card.value=idList.join(" ")
	});

	cards.forEach((card) => {
	  card.addEventListener("click", (event) => {
		  const numberOfDays = calculateDays();
		  const totalPrice = calculateSum(numberOfDays);
		  totalPricePreviewTag.innerText = `(€ ${totalPrice} total)`
	  });
	});

    const buttonBook = document.getElementById("button-book")
    const modalFooter = document.querySelector(".modal-footer")

    buttonBook.addEventListener("click", (event) => {
		  buttonBook.value="Successful!!!";
		  modalFooter.insertAdjacentHTML("afterbegin", `<p class="pr-2 mb-0" style="color: #00bf6a"><strong>Successful!!!</strong></p>`);
	  });

};

export { setConfirmation };