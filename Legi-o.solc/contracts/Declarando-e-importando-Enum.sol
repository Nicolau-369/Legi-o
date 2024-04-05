// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;
// Nosso enum foi salvo com nome de 'EnumStatus.sol'

enum Status {
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Canceled
}

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "./EnumStatus.sol";

contract Enum {
    Status public status;
};