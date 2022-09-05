// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract while_loop{
    uint[4] public arr =[1,2,3,4];
    uint public  sum = 0;

    function while_cond() public returns(uint) {
        uint count =0;
        while (count < arr.length){
            sum = sum + arr[count];
            count ++;
        }
        return sum;
    }
}
