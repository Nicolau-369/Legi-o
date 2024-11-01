// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract Gas {
    uint public i = 0;

    // Using all the gas you send causes your transaction to fail
    // State changes are undone
    // The gas that was used will not be refunded
    function forever() public {
        // Here is an example of a loop that will run until all the gas is used up
        // and consequently your transaction will fail
        while (true) {
            i += 1;
        }
    }
}
