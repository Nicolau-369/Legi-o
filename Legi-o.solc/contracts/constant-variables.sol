// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract Constantes {
    // Constant variables are usually written in capital letters
    address public constant MY_ADDRESS = 0x80F9486d904508BEb9b159b83c3605D974Baca1a;
    uint public constant MY_UINT = 123;
}

// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract Immutable {
    // Immutable variables are usually written in capital letters
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
