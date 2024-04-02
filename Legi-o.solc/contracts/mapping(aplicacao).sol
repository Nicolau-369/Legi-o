// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract GameScore {
    // Definimos nosso mapa como playerScores que irá 
    // receber o endereço do jogador e a pontuação
    mapping(address => uint) public playerScores;

    function getScore(address _addr) public view returns (uint) {
        // Iremos retornar o score atual do jogador
        return playerScores[_addr];
    }

    function setScore(address _addr, uint _score) public {
        // Atualiza o score do jogador
        playerScores[_addr] = _score;
    }
}