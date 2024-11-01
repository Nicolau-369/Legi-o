// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

// gas golf
contract GasGolf {
    // initial gas rate - 50908 gas
    // using calldata - 49163 gas
    // loading variables into memory - 48952 gas
    // Short circuit - 48634 gas
    // loop incrementer - 48244 gas
    // cached array - 48209 gas
    // load array elements into memory - 48047 gas
    // uncheck I'm overflowing/underflowing - 47309 gas

    uint public total;

    // start - no gas rate optimization
    // function sumIfEvenAndLessThan99(uint[] memory nums) external {
    //      for (uint i = 0; i < nums.length; i += 1) {
    //          bool isEven = nums[i] % 2 == 0;
    //          bool isLessThan99 = nums[i] < 99;
    //          if (isEven && isLessThan99) {
    //              total += nums[i];
    //          }
    //      }
    // }

    // gas rate optimization
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
