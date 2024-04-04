// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

// gas golf
contract GasGolf {
    // taxa gas inicial - 50908 gas
    // usando calldata - 49163 gas
    // carregando variáveis na memória - 48952 gas
    // Circuito curto - 48634 gas
    // incrementador do loop - 48244 gas
    // matriz em cache - 48209 gas
    // carregar elementos da matriz na memória - 48047 gas
    // desmarque estou transbordando/subfluindo - 47309 gas

    uint public total;

    // começo - sem otimização na taxa de gas
    // function sumIfEvenAndLessThan99(uint[] memory nums) external {
    //     for (uint i = 0; i < nums.length; i += 1) {
    //         bool isEven = nums[i] % 2 == 0;
    //         bool isLessThan99 = nums[i] < 99;
    //         if (isEven && isLessThan99) {
    //             total += nums[i];
    //         }
    //     }
    // }

    // otimização de taxa de gas
    // [1, 2, 3, 4, 5, 100]
    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        uint _total = total;
        uint len = nums.length;

        for (uint i = 0; i < len; ) {
            uint num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
            unchecked {
                ++i;
            }
        }

        total = _total;
    }
}