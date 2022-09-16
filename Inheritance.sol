// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorageContract{

    // override:    if a parent contract has the same function , so in solidity we should 
    //              use override while making changings in that function but in child contract

    // virtual:     when we are overriding a function to jo parent contract hoga us mn 
    //              us specific function py virtual ka keyword lazmi lagaya
    //              hona chahiye ,yeh us function ko overrideable banata hai


    // so in this function we are overriding by adding 5 in a favorite Number

    function store(uint256 _favoriteNumber) public override{
        FavoriteNumber = _favoriteNumber + 5;
    }
}
