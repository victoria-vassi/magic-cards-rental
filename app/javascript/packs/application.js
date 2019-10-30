import "bootstrap";
import { toggleRedBoxShadow } from '../components/selectorbar';
import { countSelectedElements } from '../components/selectorbar';

const cards = document.querySelectorAll(".card-trip");

cards.forEach((card) => {
  card.addEventListener("click", (event) => {
    countSelectedElements();
  });
});
