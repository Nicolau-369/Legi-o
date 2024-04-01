// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Foo {
    string public name = "Foo";
}