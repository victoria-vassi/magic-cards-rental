function refreshSelectorbar() {
	function toggleRedBoxShadow(card_id) {
		var element = document.getElementById(card_id);
		element.classList.toggle("selected");
	};

	function countSelectedElements() {
	  var count = document.querySelectorAll(".selected").length;
	  var element = document.getElementById("text-count");
	  element.innerText = `${count} Cards selected`
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
