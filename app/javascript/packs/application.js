// console.log('Hello World from Webpacker')
import "bootstrap";
import swal from 'sweetalert';
import flatpickr from "flatpickr";

import { calendar } from '../plugins/init_flatpickr'
import { filter } from '../plugins/init_flatpickr'
import { refreshSelectorbar } from '../components/selectorbar';
import { openCity } from '../components/tabbar';
import { typewriter } from '../components/typewriter';
// import { initSweetalert } from '../components/init_sweetalert';
import { calculatePrice } from '../components/calculateprice';
import { setConfirmation } from '../components/setConfirmation';


calendar();
filter();
refreshSelectorbar();
openCity();
calculatePrice();
setConfirmation();

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) {
    swal(options).then(callback);
  }
};

// document.querySelectorAll(".cards-icon.container .cards-hover:last-of-type").forEach((card, index) => {
//   initSweetalert(`#sweet-alert-demo-${index}`, {
//     title: "Are you sure?",
//     text: "This action cannot be reversed",
//     icon: "warning"
//   }, (value) => {
//     if (value) {
//       const link = document.querySelector(`#delete-link-${index}`);
//       link.click();
//     }
//   };
// })


// const buttons = document.querySelectorAll(".cards-icon.container .cards-hover:last-of-type")
// console.log(buttons)
// buttons.forEach((button, index) => {
//   button.addEventListener("click", function clicked(event) {
//     event.preventDefault()
//     initSweetalert(`#sweet-alert-demo-${index}`,
//       {
//       title: "Are you sure?",
//       text: "This action cannot be reversed",
//       icon: "warning",
//       buttons: true,
//       dangerMode: true,
//     }, (willDelete) => {
//       if (willDelete) {
//          swal("Your file has been deleted!", {
//          icon: "success"
//         });
//         const link = document.querySelector(`#delete-link-${index}`);

//           setTimeout(function() {
//             link.click()
//           }, 3000);
//         ;
//       } else {
//       swal("Your file is safe!");
//       }
//     })


//   })
// })


