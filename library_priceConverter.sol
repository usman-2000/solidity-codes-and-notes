// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Library
// Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.

// A library is embedded into the contract if all library functions are internal.
// Library k andr saray function intERnal hoty hain

// Otherwise the library must be deployed and then linked before the contract is deployed.

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library priceConverter{

    function getPrice()internal  view returns(uint256){
        // we need two things
        // 1 ABI
        // 2 Address 	0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = priceFeed.latestRoundData();

        // eth in terms of USD
        // 3000.00000000

        return uint256(price * 1e10); //1e10= 1**10
    }

    function getVersion() internal  view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18 ;// bcz 36 extra zeroes will add so we divide by this to get only 18 zero
        return (ethAmountInUsd);

    }
}
