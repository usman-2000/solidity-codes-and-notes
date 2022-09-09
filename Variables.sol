// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// There are 3 types of variables in Solidity

// local
// declared inside a function
// not stored on the blockchain
// state
// declared outside a function
// stored on the blockchain
// global (provides information about the blockchain)


contract Variables{
    // state variables stored in blockchain

    string public name = "usman";
    uint public num = 1231;

    // local variables not stored in blockchain

    function do_something() public view returns(address){
        int i = 213;


        // Global variables gives the info about the blockchain

        uint timestamp = block.timestamp;
        address sender = msg.sender;

        return sender;

    }
}
