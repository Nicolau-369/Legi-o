// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract SimpleStorage {
    // State variable to store a value
    uint public num;

    // You need to send a transaction to be able to update the value of the num variable
    function set(uint _num) public {
        num = _num;
    }

    // You can read the value of the variable num without having to send any transaction
    function get() public view returns (uint) {
        return num;
    }
}
