// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorageContract{
    uint256 FavoriteNumber;
    mapping (string => uint256) public nameTofavNumber;

    struct People{
        string name;
        uint256 FavoriteNumber; 
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public {
        FavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return FavoriteNumber;
    }

    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        nameTofavNumber[_name]=_favoriteNumber;
        people.push(People(_name,_favoriteNumber));
    }




}
