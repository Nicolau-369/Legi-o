// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract ReceiveEther {
    /*
    Qual função é chamada, fallback() ou receive()?

           send Ether
               |
         msg.data está vazio?
              / \
            sim  não
            /     \
receive() existe?  fallback()
         /   \
        sim   não
        /      \
    receive()   fallback()
    */

    // Função para receber Ether, 'msg.data' deve estar vazio
    receive() external payable {}

    // A função 'fallback' é chamada quando msg.data não está vazio
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // Esta função não é mais recomendada para enviar Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send retorna um valor booleano indicando sucesso ou falha.
        // Esta função não é recomendada para enviar Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Falha ao enviar Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call retorna um valor booleano indicando sucesso ou falha.
        // Este é o método recomendado atual para enviar Ether.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Falha ao enviar Ether");
    }
}