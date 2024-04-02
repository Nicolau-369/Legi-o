// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract ArrayReplaceFromEnd {
    uint[] public arr;

    // A remoção de um elemento da matriz cria uma lacuna vazia.
    // Uma maneira de manter o array compacto é 
    // mover o último elemento para o índice que foi removido.
    function remove(uint index) public {
        // Move o último elemento para o índice que foi removido
        arr[index] = arr[arr.length - 1];
        // Remove o último elemento
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}