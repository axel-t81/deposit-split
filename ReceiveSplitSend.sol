// SPDX-License-Identifier: MIT

// Guide provided by https://docs.alchemy.com/docs/how-to-send-value-from-within-a-smart-contract-using-solidity

pragma solidity ^0.8.0;

contract ReceiveSplitSend {
    // Set the 2 user EOA addresses who will receive the value

    // Declare the variable
    address public userAddress1;
    address public userAddress2;

    // Use the first address variable
    function setAddress(address _newAddress1) public { 
        userAddress1 = _newAddress; 
    }
    
    // Use the first address variable
    function setAddress(address _newAddress2) public { 
        userAddress2 = _newAddress;
    }

    // Set how much ether is to be received by the contract. Note this is expressed in Wei (and you may need that bookmarked coverter)
    uint256 amount = 200000000000000000; // 0.2 ether
    // You need to be able to work how to make this a variable, and set homehow

    uint256 split = amount / 2;

    // Implement the receive function, so the contract can receive ether from EOAs and other smart contracts
    receive() external payable {}
    // Note this function is coming after the amount received is set, i.e. (a) receive x, and now we allow x to be received

    function sendPayment1(userAddress1 payable recipient) public {
        (bool success, ) = recipient.call{value: split}("");
        require(success, "Payment failed.");
    }

    function sendPayment2(userAddress2 payable recipient) public {
        (bool success, ) = recipient.call{value: split}("");
        require(success, "Payment failed.");


}
