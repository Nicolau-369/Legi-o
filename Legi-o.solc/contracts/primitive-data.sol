// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract PrimitiveData {
    bool public True = true;

    /*
    uint represents an unsigned integer value, i.e. positive integers >= 0
    can be set to different sizes
        uint8 ranges from 0 to 2 ** 8 - 1
        uint16 ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint is the same as uint256

    /*
    For negative numbers, the int type must be used
    Just like in uint, we can define different 
    int ranges that are int8 to int256
    
    int256 ranges from -2 ** 255 to 2 ** 255 - 1
    int128 ranges from -2 ** 127 to 2 ** 127 - 1
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int is the same as int256

    // minimum and maximum of int
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // Our address, if you feel free to send us some bnb's :)
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
    In Solidity, the byte data type represents a sequence of bytes. 
    Solidity presents two types of bytes:

     - fixed size byte arrays
     - dynamically sized byte arrays.
     
     The term bytes in Solidity represents a dynamic array of bytes.
     It is an abbreviation for byte[] .
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]
    
    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
