// console.log('Hello World from Webpacker')
import "bootstrap";
import flatpickr from "flatpickr";
import { calendar } from '../plugins/init_flatpickr'
import { filter } from '../plugins/init_flatpickr'
import { refreshSelectorbar } from '../components/selectorbar';
import { openCity } from '../components/tabbar';
import { typewriter } from '../components/typewriter';
import { initSweetalert } from '../components/init_sweetalert';
import { calculatePrice } from '../components/calculateprice';

calendar();
filter();
refreshSelectorbar();
openCity();
calculatePrice();

document.querySelectorAll(".cards-icon.container .cards-hover:last-of-type").forEach((card, index) => {
  initSweetalert(`#sweet-alert-demo-${index}`, {
    title: "Are you sure?",
    text: "This action cannot be reversed",
    icon: "warning"
  }, (value) => {
    if (value) {
      const link = document.querySelector(`#delete-link-${index}`);
      link.click();
    }
  });
})