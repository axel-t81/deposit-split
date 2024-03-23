// SPDX-License-Identifier: MIT

// Guide provided by https://docs.alchemy.com/docs/how-to-send-value-from-within-a-smart-contract-using-solidity

pragma solidity ^0.8.0;

contract ReceiveSplitSend {
    // Set the 2 user EOA addresses who will receive the value

    // Declare the variable
    address public userAddress1;
    address public userAddress2;

    constructor() {
        userAddress1 = 0x176be03A0573172697631C54edDAb037151a7202;
        userAddress2 = 0xE70e7784Dd8200aB1527b3E8DA4903C0838a5FA3;
    }

    // Set how much ether is to be received by the contract. Note this is expressed in Wei (and you may need that bookmarked coverter)
    uint256 amount = 100000000000000; // 0.0001 ether
    // You need to be able to work how to make this a variable, and set homehow

    uint256 split = amount / 2;

    // Implement the receive function, so the contract can receive ether from EOAs and other smart contracts
    receive() external payable {}

    // Note this function is coming after the amount received is set, i.e. (a) receive x, and now we allow x to be received

    /// This is meant to use 1 function to sendPayment to mutiple addresses
    function sendPayment(userAddress2) public {
        (bool success, ) = userAddress1.call{value: split}("");
        require(success, "Payment failed.");
        (bool success, ) = userAddress2.call{value: split}("");
        require(success, "Payment failed.");
    }
}

// Still Not working. But Look to guide here (as it prompted some ideas https://stackoverflow.com/questions/68512911/sending-more-than-1-addresses-to-solidity-function)
// And keep going back to the working ReceiveThenSend contract, to stick with what has worked.
