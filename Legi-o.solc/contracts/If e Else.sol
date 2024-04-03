// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract IfElse {
    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    // Utilizando o if ternário, podemos reduzir as linhas de código,
    // facilitando nossa leitura do código
    function ternario(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // Maneira abreviada de escrever a instrução if / else
        // Nessa instrução, se o _x for menor que 10, 
        // retornará true e então nos retornar o valor 
        // que está após o ?, ou seja o 1, em caso de false, 
        // irá retornar o valor após o :, ou seja o 2
        return _x < 10 ? 1 : 2;
    }
}