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
import { setConfirmation } from '../components/setConfirmation';


calendar();
filter();
refreshSelectorbar();
openCity();
calculatePrice();
setConfirmation();

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
//   });
// })

document.querySelectorAll(".cards-icon.container .cards-hover:last-of-type").forEach((card, index) => {
  initSweetalert(`#sweet-alert-demo-${index}`,
    swal ({
    title: "Are you sure?",
    text: "This action cannot be reversed",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((willDelete) => {
    if (willDelete) {
       swal("Poof! Your file has been deleted!", {
       icon: "success",
      });
    } else {
    swal("Your file is safe!");
    }
  })

  });
})

