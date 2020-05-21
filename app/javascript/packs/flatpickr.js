import flatpickr from "flatpickr";
// import 'flatpickr/dist/themes/airbnb.css'

const initDatePicker = () => {
  flatpickr(".datepicker", {
    altInput: true
  });
}

initDatePicker();
