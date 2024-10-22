// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract IfElse {
    function fooo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2
        }
    }

    // Using the ternary if, we can reduce the lines of code,
    // making it easier to read the code
    function ternario(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // Shorthand way of writing if/else statement
        // In this instruction, if _x is less than 10, 
        // will return true and then return the value 
        // which is after the ?, that is, the 1, in case of false, 
        // will return the value after the :, i.e. 2
        return _x < 10 ? 1 : 2;
    }
}
