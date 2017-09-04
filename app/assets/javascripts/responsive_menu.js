function navigation_hide_show(elementId, elementClass) {
  var navigation = document.getElementById(elementId);
  if (navigation.className == elementClass) {
    navigation.className = '';
  } else {
    navigation.className = elementClass;
  }
}

function show_menu(elClassId) {
  var dropdown = document.getElementsByClassName(elClassId)[0];
  var state = dropdown.getAttribute("aria-expanded");

  if (state == 'false') {
    dropdown.setAttribute("aria-expanded", "true");
  } else {
    dropdown.setAttribute("aria-expanded", "false"); 
  }

  document.addEventListener('click', function collapse_dropdown(event){
    if (dropdown.contains(event.target) == true) {
      dropdown.setAttribute("aria-expanded", "true");
    } else if (event.target.parentElement == null || dropdown.parentElement != event.target.parentElement && dropdown != event.target.parentElement.previousElementSibling) {
      dropdown.setAttribute("aria-expanded", "false");
      document.removeEventListener('click', collapse_dropdown);
    }
  });
}
