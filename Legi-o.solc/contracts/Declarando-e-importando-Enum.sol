// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

// Our enum was saved with the name 'Declaring-and-importing-Enum.sol'

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
