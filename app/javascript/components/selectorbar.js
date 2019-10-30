function toggleRedBoxShadow(card_id) {
	var element = document.getElementById(card_id);
	element.classList.toggle("selected");
};

function countSelectedElements() {
  var count = document.querySelectorAll(".selected").length;
  var element = document.getElementById("text-count");
  element.innerText = `${count} Cards selected`
};

export { toggleRedBoxShadow };
export { countSelectedElements };
