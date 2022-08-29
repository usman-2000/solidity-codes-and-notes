// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract arrays{

    // FIXED SIZE LENTHS ARRAYS


    uint[3] public nums = [12,23,4];

    function setNumber(uint index, uint value) public{
        nums[index] = value;

    }

    function getLength() public view returns(uint){
        return nums.length;
    }
}
