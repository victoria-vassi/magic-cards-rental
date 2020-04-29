
import swal from 'sweetalert';


const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
    swal(options).then(callback);
};



const deleteCardAlert = () => {
const buttons = document.querySelectorAll(".sweet-alert-btn")
buttons.forEach((button, index) => {
  button.addEventListener("click", function clicked(event) {
    event.preventDefault()
    const index = event.target.dataset.id
    initSweetalert(`#sweet-alert-demo-${index}`,
      {
      title: "Are you sure?",
      text: "This action cannot be reversed",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    }, (willDelete) => {
      if (willDelete) {
         swal("Your file has been deleted!", {
         icon: "success"
        });
        const link = document.querySelector(`#delete-link-${index}`);

          setTimeout(function() {
            link.click()
          }, 3000);
        ;
      } else {
      swal("Your file is safe!");
      }
    })
  })
})

}


const noDeleteBtn = () => {
const buttonsNotDelete = document.querySelectorAll(".button-not-delete")

buttonsNotDelete && buttonsNotDelete.forEach((button) => {
  button.addEventListener('click', (e) => {
      swal("Sorry!", "This card has a current booking!", "error");
  })
})
}

export { deleteCardAlert, noDeleteBtn }
