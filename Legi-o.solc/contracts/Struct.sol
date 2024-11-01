// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract Todos {
    // Declaration of a 'Todo' struct within the contract
    struct Todo {
        string text;
        bool completed;
    }

    // Declaration of an array of type 'Todo'
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a structure
        // - passing the values ​​'_text' and 'false' as a parameter
        todos.push(Todo(_text, false));

        // passing the values ​​into the defined keys
        todos.push(Todo({text: _text, completed: false}));

        // initializing empty and then updating the value
        Todo memory todo;
        todo.text = _text;
        // todo.completed - by default initializes to false

        todos.push(todo);
    }

    // Solidity automatically creates a getter for objects in the 'all' array then
    // you don't really need this function.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
        // Another way to return the above values ​​would be:
        // return (todos[_index].text, todos[_index].completed);
    }

    // Updating the value of the text variable of a given 'todo'
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // Updating the value of the completed variable of a given 'todo'
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
