// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract SimpleStorage {
    // Variável de estado para armazenar um valor
    uint public num;

    // Você precisa enviar uma transação para poder atualizar o valor da variável num
    function set(uint _num) public {
        num = _num;
    }

    // Você pode ler o valor da variável num sem precisar enviar nenhuma transação
    function get() public view returns (uint) {
        return num;
    }
}