// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Constantes {
    // Variáveis constantes geralmente são escritas com letras maiúsculas
    address public constant MEU_ENDERECO = 0x80F9486d904508BEb9b159b83c3605D974Baca1a;
    uint public constant MEU_UINT = 123;
}

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Imutavel {
    // Variáveis imutáveis geralmente são escritas com letras maiúsculas
    address public immutable MEU_ENDERECO;
    uint public immutable MEU_UINT;

    constructor(uint _myUint) {
        MEU_ENDERECO = msg.sender;
        MEU_UINT = _myUint;
    }
}