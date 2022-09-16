// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList{

  struct Todo {
      string text;
      bool completed;
  }
   Todo[] public todos;

 function create(string calldata _text) external {

     todos.push(Todo({
         text: _text,
         completed: false
     }));

 }

 function updateText(uint _index, string calldata _text) external {

     todos[_index].text = _text; //tek degisken icin bu yontem daha ucuz

     /* Todo storage todo = todos[_index];
     todo.text = _text; for multiple updates cheaper then 23. code
     */
 }

 function read(uint _indexed) external view returns(string memory, bool){
     // return (todos[_indexed].text, todos[_indexed].completed); (my way)
     Todo storage todo = todos[_indexed];
     return(todo.text, todo.completed);
 
 }

 function toggleCompleted(uint _index) external {

     todos[_index].completed = !todos[_index].completed;

 }

} 