// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Todos {
    // Declaração de uma struct 'Todo' dentro do contrato
    struct Todo {
        string text;
        bool completed;
    }

    // Declaração de uma array do tipo 'Todo'
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 formas de inicializar uma estrutura
        // - passando os valores '_text' e 'false' como parâmetro
        todos.push(Todo(_text, false));

        // passando os valores nas chaves definidas
        todos.push(Todo({text: _text, completed: false}));

        // inicializando vazio e depois atualizando o valor
        Todo memory todo;
        todo.text = _text;
        // todo.completed - por padrão inicializa como false

        todos.push(todo);
    }

    // Solidity cria automaticamente um getter para objetos da array 'todos' então
    // você realmente não precisa dessa função.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
        // Outra maneira de retornar os valores acima seria:
        // return (todos[_index].text, todos[_index].completed);
    }

    // Atualizando o valor da variável text de um determinado 'todo'
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // Atualizando o valor da variável completed de um determinado 'todo'
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}