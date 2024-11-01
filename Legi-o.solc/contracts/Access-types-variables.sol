// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract Variaveis {
    // State variables are stored on the blockchain
    string public text = "hello Solidity";
    uint public number = 123;

    function updateVariables() public {
        // Local variables are not saved on the blockchain 
        // and can only be accessed within the function that declared it
        uint i = 456;

        // These are some of the global variables having their value 
        // assigned to a local variable
        uint timestamp = block.timestamp; // Timestamp of the current block
        address sender = msg.sender; // Address of the person who called the contract
    };
};
