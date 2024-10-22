// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract Array {
    // Ways to define an array
    uint[] public arr; // Dynamic Size Array
    // Dynamically sized array initialized with values ​​[1, 2, 3]
    uint[] public arr2 = [1, 2, 3];

    // Fixed size array, all elements initialize to 0
    uint[10] public myFixedSizedArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity can return the entire array
    // But this function should be avoided for arrays 
    // which can grow indefinitely in size
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // Add a value to the array
        // This will increase the size of the array by 1
        arr.push(i);
    }

    function pop() public {
        // Remove the last added value
        // This will decrease the size of the array by 1
        arr.pop();
    }

    function getLength() public view returns (uint) {
        // Returns the size of the matrix
        return arr.length;
    }

    function remove(uint index) public {
        // Deleting the value of an index will not decrease the value of the array.
        // Will set the value at index to the default value of the type,
        // in this case, the value will be set to 0
        delete arr[index];
    }

    function examples() external {
        // Create a new array in memory
        // Only fixed size matrices can be created like this
        uint[] memory a = new uint[] (5)
    }
}
