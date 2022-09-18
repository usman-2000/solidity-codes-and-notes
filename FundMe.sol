// Get Funds from users
// Withdraw funds
// set a mininmum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// payable:   is attribute sy hm value k attribute ko access kr skty hain.

contract FundMe{

    function fund() public payable {
    // 1: want to be able to send the minimum amount in USD
    // 2: how do we send ETH to this contract
        require(msg.value >1e18,"Didn't send enough"); // 1e18 == 1 *10**18

        // What is reverting?
        //        undo any action before and send remaining gas back

    }


}
