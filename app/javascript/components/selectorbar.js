function toggleRedBoxShadow(card_id) {
	var element = document.getElementById(card_id);
	element.classList.toggle("selected");
}

export { toggleRedBoxShadow };
