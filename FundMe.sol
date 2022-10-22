// Get Funds from users
// Withdraw funds
// set a mininmum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// chainlink is a technology for getting external data and doing external computation 
// in a decentralized context for our smart contracts.


// payable:   is attribute sy hm value k attribute ko access kr skty hain.


//Here we are importing a linrary
import "./priceConverter.sol";

contract FundMe{

    using priceConverter for uint256;

    uint256 public minimumUSD = 50 * 1e18;
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    function fund() public payable {
    // 1: want to be able to send the minimum amount in USD
    // 2: how do we send ETH to this contract
        require(msg.value.getConversionRate() >minimumUSD,"Didn't send enough"); // 1e18 == 1 *10**18
        // 18 decimals
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;

        // What is reverting?
        //        undo any action before and send remaining gas back

    }

    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex<funders.length;funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;

        }

        //resetting an array
        funders = new address [](0);

        // Sending ETH to the Contract
        // Three Different ways to do this
        // 1: transfer    (2300 gas, throws error)
        // 2: send        (2300 gas, returns bool)
        // 3: call        (forward all gas or set gas, returns bool)

        // call in combination with re-entrancy guard is the recommended method to use after December 2019.

        // msg.sender = address
        // payable msg.sender = payable address

        payable(msg.sender).transfer(address(this).balance);

    }

    


}

