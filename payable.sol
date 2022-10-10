// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

// is contract mn pehly hmne contract mn send kraye hain ethers phr usky bad aik adddress pr bhjy hain

contract PayEthers{

    address payable user = payable (0x17F6AD8Ef982297579C203069C1DbfFE4348c372);

    function payToContract() payable public {

    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendToUser() public {
        user.transfer(3 ether);
    }
}
