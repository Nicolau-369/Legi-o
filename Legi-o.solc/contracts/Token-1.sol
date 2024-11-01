// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract TokenWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        // Below we check if the address that called the function
        // withdraw is the owner or not of the portfolio contract
        require(msg.sender == owner, "is not the owner");

        // If he is the owner, he will transfer the amount
        // to the wallet that made the request
        payable(msg.sender).transfer(_amount);
    }

    // Returns the token balance in the wallet
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
