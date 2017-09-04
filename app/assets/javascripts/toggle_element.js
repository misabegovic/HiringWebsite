function toggleElement(id1, id2) {
  var element1 = document.getElementById(id1);
  var element2 = document.getElementById(id2);

  if (element1.className == 'hidden') {
    element1.className = '';
    element2.className = 'hidden';
  } else {
    element2.className = '';
    element1.className = 'hidden';
  }
}

function removeClass(elementID, elementClass, elementToDelete) {
  element = document.getElementById(elementID);
  element.classList.remove(elementClass);
  if (elementToDelete) {
    elementToDelete.parentNode.removeChild(elementToDelete);
  }
}
