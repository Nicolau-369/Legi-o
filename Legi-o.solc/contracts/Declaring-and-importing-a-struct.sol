// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
// This is saved 'StructTodo.sol'

struct Todo {
    string text;
    bool completed;
}

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "./StructTodo.sol";

contract Todos {
    // Uma array de estrutura 'Todo'
    Todo[] public todos;
};
