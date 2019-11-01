// console.log('Hello World from Webpacker')
import "bootstrap";
import flatpickr from "flatpickr";

import { calendar } from '../plugins/init_flatpickr'
import { filter } from '../plugins/init_flatpickr'
import { refreshSelectorbar } from '../components/selectorbar';
import { openCity } from '../components/tabbar';
import { typewriter } from '../components/typewriter';
import { deleteCardAlert } from '../components/init_sweetalert';
import { noDeleteBtn } from '../components/init_sweetalert';
import { calculatePrice } from '../components/calculateprice';
import { setConfirmation } from '../components/setConfirmation';


calendar();
filter();
refreshSelectorbar();
openCity();
calculatePrice();
setConfirmation();
deleteCardAlert();
noDeleteBtn();


