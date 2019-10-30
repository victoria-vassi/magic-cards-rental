const openCity = () => {

  const links = document.querySelectorAll(".tablinks")
  links.forEach((link) => {
    link.addEventListener("click", (e) => {
      var i, tabcontent, tablinks;

      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
      }

      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
      }

      document.getElementById(`${e.currentTarget.innerText}`).style.display = "block";
      e.currentTarget.className += " active";
    })
  })
}

export { openCity }
