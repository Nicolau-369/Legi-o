// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract EtherUnits {
    uint public umWei = 1 wei;
    // 1 wei é igual a 1
    bool public ehUmWei = 1 wei == 1;

    uint public umEther = 1 ether;
    // 1 ether é igual a 10^18 wei
    bool public ehUmEther = 1 ether == 1e18;
}