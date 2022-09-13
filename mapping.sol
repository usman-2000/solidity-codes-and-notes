// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
// Maps are created with the syntax mapping(keyType => valueType).
// Like a dictionary in which key type and a value type

contract MAPPIUNGS{
    mapping (string => uint256) public nameTofavNumber;

    struct People{
        string name;
        uint256 FavoriteNumber; 
    }

    People[] public people;

    function addPeople(string memory _name, uint256 _favoriteNum) public {
        nameTofavNumber[_name]=_favoriteNum;
        people.push(People(_name,_favoriteNum));
    }
}
