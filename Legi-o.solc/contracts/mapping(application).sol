// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract GameScore {
    // We define our map as playerScores which will 
    // receive the player's address and score
    mapping(address => uint) public playerScores;

    function getScore(address _addr) public view returns (uint) {
        // We will return the player's current score
        return playerScores[_addr];
    }

    function setScore(address _addr, uint _score) public {
        // Update the player's score
        playerScores[_addr] = _score;
    }
}
