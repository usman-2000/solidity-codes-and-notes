// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract view_pure{

    // view : Jab koi value srf read krni ho 
    uint256 favouriteNum ;

    //  we only need a gas if we modify the block state.
    function retrieve() public view returns(uint256){
        return favouriteNum;
    }

    function add() public pure returns(uint256){
        return (1+1);
    }
}
