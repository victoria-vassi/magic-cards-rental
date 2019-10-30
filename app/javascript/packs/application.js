import "bootstrap";
import flatpickr from "flatpickr";
import { calendar } from '../plugins/init_flatpickr'
import { refreshSelectorbar } from '../components/selectorbar';
import { typewriter } from '../components/typewriter';

calendar();
refreshSelectorbar();
