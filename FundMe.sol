// Get Funds from users
// Withdraw funds
// set a mininmum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


// chainlink is a technology for getting external data and doing external computation 
// in a decentralized context for our smart contracts.


// payable:   is attribute sy hm value k attribute ko access kr skty hain.

// rever()   keyword do exactly same thing as the require keyword without getting the conditions
//           you can use the revert keyword where you want


//Here we are importing a linrary
import "./priceConverter.sol";

error NotOwner();

contract FundMe{

    using priceConverter for uint256;


    //     By using constant,immutable keyword we can save the gas
    uint256 public constant MINIMUM_USD = 50 * 1e15;
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;


    // immutable variable k sath i ka prefix laga dena chahiye is sy pata lagta hai k immutable 
    //variable hai
    address public immutable i_owner;

    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable {
    // 1: want to be able to send the minimum amount in USD
    // 2: how do we send ETH to this contract
        require(msg.value.getConversionRate() >MINIMUM_USD,"Didn't send enough"); // 1e18 == 1 *10**18
        // 18 decimals
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;

        // What is reverting?
        //        undo any action before and send remaining gas back

    }

    function withdraw() public onlyOwner {
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

        //transfer
        payable(msg.sender).transfer(address(this).balance);

        //send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess,"SENDING FAILED");

        //call
        //       call function returns two variables
        (bool callSuccess,) =payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess,"Call Failed");

    }

    modifier onlyOwner{
        // require(msg.sender==i_owner,"Only owner can withraw");


        if(msg.sender!=i_owner){
            revert NotOwner();
        }


        _; // yeh agar neechy likhein require statement sy to iska mtlb hota hai k pehly yeh 
        //require statement chalaygi agr fulfile hui to further code chalay ga

        // agar yeh require statement sy pehlay laga hoga to iska mtlb hai k pehly code chalay
        //phr statement chalaygi

    }

    // What happens if someone sends this contract eth without calling the fund function
    // Two special functions:
    // recieve()
    // fallback()

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

}

