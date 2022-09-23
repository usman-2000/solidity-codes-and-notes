// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
// reverse kr dy ga nmbr ko
// let suppose aik num liya 123
// mode liya to 3 aagaya .... mode = 3
// multiply krayengay mode ko 10 sy ..... mode *= 10 = 30
// subtract mode from num and divide by 10 .... 123-3 /10

contract Day6 {
    function revDigit(uint256 n) public pure returns (uint256) {
        uint256 reverse;
        // uint remainder = 0;
        while(n>0){
            uint mode = n%10;
            reverse += mode;
            n = (n-mode) / 10;
            if(n>0){
                reverse *=10;

            }
        }
        return (reverse);
    }
}
