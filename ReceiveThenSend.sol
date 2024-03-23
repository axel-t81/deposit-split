// SPDX-License-Identifier: MIT

// Guide provided by https://docs.alchemy.com/docs/how-to-send-value-from-within-a-smart-contract-using-solidity

// Then guide to generate smart contract and use by https://docs.optimism.io/builders/app-developers/tutorials/first-contract

pragma solidity ^0.8.0;

contract ReceiveThenSend {
    // Set how much ether is to be received by the contract. Note this is expressed in Wei (and you may need that bookmarked coverter)
    uint256 amount = 100000000000000; // 0.001 ether

    // You need to be able to work how to make this a variable, and set homehow

    // Implement the receive function, so the contract can receive ether from EOAs and other smart contracts
    receive() external payable {}

    /// This was your v1 when trying to get it to compile in Remix
    function sendPayment(address payable recipient) public {
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Payment failed.");
    }
}
