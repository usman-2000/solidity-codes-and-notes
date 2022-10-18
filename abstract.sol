// Abstract contracts are contracts that have atleast one function without its implementation
// To make a contract abstract you have to use abstract keyword

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

abstract contract parent{
    uint public str;
    string public name;

    constructor(){
        str=123;
        name="usman";

    }

    function setter(uint _str) public virtual ;
}

contract child is parent{
    uint public x;

    function setter(uint _str) public override {
        str = _str;
    }
}
