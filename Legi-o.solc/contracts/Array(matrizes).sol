// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Array {
    // Maneiras para definir uma array
    uint[] public arr; // Array de tamanho dinâmico
    // Array de tamanho dinâmico inicializada com os valores [1, 2, 3]
    uint[] public arr2 = [1, 2, 3];

    // Array de tamanho fixo, todos os elementos inicializam em 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity pode retornar o array inteiro
    // Mas esta função deve ser evitada para arrays 
    // que podem crescer indefinidamente em tamanho
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // Adiciona um valor na matriz
        // Isso aumentará o tamanho da matriz em 1
        arr.push(i);
    }

    function pop() public {
        // Remove o último valor adicionado
        // Isso diminuirá o tamanho da matriz em 1
        arr.pop();
    }

    function getLength() public view returns (uint) {
        // Retorna o tamanho da matriz
        return arr.length;
    }

    function remove(uint index) public {
        // Excluir o valor de um índice não irá diminuir o valor da matriz.
        // Irá definir o valor no índice para o valor padrão do tipo,
        // neste caso, o valor será setado para 0
        delete arr[index];
    }

    function examples() external {
        // Cria uma nova matriz na memória
        // Somente matrizes com tamanho fixo podem ser criadas assim;
        uint[] memory a = new uint[](5)
    }
}