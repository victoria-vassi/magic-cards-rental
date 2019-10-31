import "bootstrap";
import flatpickr from "flatpickr";
import { calendar } from '../plugins/init_flatpickr'
import { filter } from '../plugins/init_flatpickr'
import { refreshSelectorbar } from '../components/selectorbar';
import { openCity } from '../components/tabbar';
import { typewriter } from '../components/typewriter';

calendar();
filter();
refreshSelectorbar();
openCity();
