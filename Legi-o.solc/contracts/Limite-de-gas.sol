// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Gas {
    uint public i = 0;

    // Usar todo o gas que você envia faz com que sua transação falhe
    // As alterações de estado são desfeitas
    // O gas que foi utilizado não será reembolsado
    function forever() public {
        // Aqui um exemplo de um loop onde irá executar até que todo o gas seja gasto
        // e consequentemente sua transação irá falhar
        while (true) {
            i += 1;
        }
    }
}