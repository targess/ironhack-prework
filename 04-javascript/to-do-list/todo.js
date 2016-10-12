
window.onload = function() {

// the following code adds event listeners to the buttons
// you'll learn more about this later
// for this exercise, you are going to write the functions for
// what happens when the user clicks on the buttons.
  var saveButton = document.getElementById('save-button');
  saveButton.addEventListener('click', addToDoItem, false);

  var doneButton = document.getElementById('done-button');
  doneButton.addEventListener('click', markAsDone, false);


  function addToDoItem() {
    var newTask = document.getElementById('todo-input').value;
    var todoItem = document.createElement('li');
    todoItem.textContent = newTask;
    var todoList = document.querySelector('.todo-list-items');
    todoList.appendChild(todoItem);
  }

  function markAsDone() {
    doneButton.classList.add('liked');
    doneButton.innerHTML = "Liked!";
    document.querySelector('h1').style.color = "red";

    var doneItem = document.querySelector('.todo-list-items li');
    var doneList = document.querySelector('.done-list-items');
    doneList.appendChild(doneItem);
    doneItem.classList.add('done');
  }
  
}
