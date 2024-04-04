// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Variaveis {
    // As variáveis de estado são armazenadas na blockchain
    string public texto = "ola Solidity";
    uint public numero = 123;

    function atualizaVariaveis() public {
        // As variáveis locais não são salvas na blockchain 
        // e só podem ser acessadas dentro da função que a declarou
        uint i = 456;

        // Essas são algumas das variáveis globais tendo seu valor 
        // atribuido à uma variável local
        uint timestamp = block.timestamp; // Timestamp do bloco atual
        address sender = msg.sender; // Endereço de quem chamou o contrato
    };
};