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





contract bytesdetails{
    // bytes k ander ham koi bhi value deingay to wo uski hexadecimal value return kryga
    // bytes k andr usky size ki values hi de skty hain jese k bytes1 mn srf aik value de skty

    bytes1 public b1;
    bytes2 public b2;
    bytes3 public b3;

    function setBytes() public {
        b1 = 'a';
        b2 = 'ab';
        b3 = 'abc';
    }
}
