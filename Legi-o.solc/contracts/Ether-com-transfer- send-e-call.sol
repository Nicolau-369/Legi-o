// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 <0.9.0;

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes no
            / \
receive() exists?  fall back()
         / \
        yes no
        / \
    receive() substitute()
    */

    // Function to receive Ether, 'msg.data' must be empty
    receive() external payable {}

    // The 'fallback' function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method for sending Ether.
        (bool sent, bytes memory data) = _to.call{value: msg.sender}("");
        require(sent, "Failed to send Ether");
    }
}
