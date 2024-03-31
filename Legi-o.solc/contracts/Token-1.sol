// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract TokenWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        // Abaixo verificamos se o endereço que chamou a função
        // withdraw é o proprietário ou não do contrato carteira
        require(msg.sender == owner, "nao e o proprietario");

        // Se for o proprietário, ele irá transferir a quantidade
        // para a carteira a qual fez a requisição
        payable(msg.sender).transfer(_amount);
    }

    // Retorna o saldo do token na carteira
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}