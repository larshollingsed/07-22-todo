// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.onload = markCheckboxes;

function markCheckboxes() {
  $(".checkbox_for_item").onchange = markChecked;  
}

function markChecked() {
  alert("hi")
}