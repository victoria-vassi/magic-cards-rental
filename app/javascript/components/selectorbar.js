function refreshSelectorbar() {
	function toggleRedBoxShadow(card_id) {
		var element = document.getElementById(card_id);
		element.classList.toggle("card-selected");
	};

	function countSelectedElements() {
	  var count = document.querySelectorAll(".card-selected").length;
	  var element = document.getElementById("text-count");
	  element.innerText = `${count} cards selected`
	};

	const cards = document.querySelectorAll(".card-trip-selectable");
	cards.forEach((card) => {
	  card.addEventListener("click", (event) => {
	  	toggleRedBoxShadow(`${event.currentTarget.id}`)
	    countSelectedElements();
	  });
	});
};

export { refreshSelectorbar };
