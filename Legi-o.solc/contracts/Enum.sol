// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract Enum {
    // Enum representing the shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // The default value is the first element listed in the 
    // type definition, in this case "Pending"
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint in input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete - resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}
