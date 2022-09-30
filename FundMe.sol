// Get Funds from users
// Withdraw funds
// set a mininmum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// chainlink is a technology for getting external data and doing external computation 
// in a decentralized context for our smart contracts.


// payable:   is attribute sy hm value k attribute ko access kr skty hain.

contract FundMe{

    uint256 public minimumUSD = 50 * 1e18;

    function fund() public payable {
    // 1: want to be able to send the minimum amount in USD
    // 2: how do we send ETH to this contract
        require(getConversionRate(msg.value) >minimumUSD,"Didn't send enough"); // 1e18 == 1 *10**18
        // 18 decimals

        // What is reverting?
        //        undo any action before and send remaining gas back

    }

    function getPrice()public view returns(uint256){
        // we need two things
        // 1 ABI
        // 2 Address 	0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = priceFeed.latestRoundData();

        // eth in terms of USD
        // 3000.00000000

        return uint256(price * 1e10); //1e10= 1**10
    }

    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
      uint256 ethPrice = getPrice();
      uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18 ;// bcz 36 extra zeroes will add so we divide by this to get only 18 zero
      return (ethAmountInUsd);

    }


}

