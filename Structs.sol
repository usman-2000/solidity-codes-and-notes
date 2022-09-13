// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


// Note: Warnings don't stop your code from working but it a good idea to check them first


// You can define your own type by creating a struct.
// They are useful for grouping together related data.
// Structs can be declared outside of a contract and imported in another contract.



contract structs_and_arrays{
    // uint256 favouriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
        uint8 age;
    }

    // Yeh ham jis struct k liye bana rahay hoty hain to naam bhi start mn usi ka likhty hain
    People[] public people;
    People[] public peopleM2;

    // people public person1 = people({favouriteNumber : 21, name: "Usman", age: 22});
    // people public person2 = people({favouriteNumber : 221, name: "rahim", age: 22});
    // people public person3 = people({favouriteNumber : 43, name: "kahlid", age: 22});
    // people public person4 = people({favouriteNumber : 11, name: "sami", age: 32});
// an array that stores the list

    function pushElement(uint256 _favoriteNumber,string memory _name, uint8 _age) public {
        people.push(People(_favoriteNumber,_name,_age));
    }

    function pushElementMethod2(uint256 _favoriteNumber,string memory _name, uint8 _age) public {
        People memory newPerson =  People({favoriteNumber: _favoriteNumber, name: _name, age: _age});
        peopleM2.push(newPerson);
    }

}


// EVM can access and store info in six places
// 1 stack
// 2 memory : Variable only exists temporarily , it can be modified.
// 3 storage 
// 4 call data : Call data is temporarily variables that can't be modifies
// 5 code 
// 6 logs


contract Todos{
    struct Todo{
        string text;
        bool completed;
    }


    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo(_text,false));
    }

    // update text

    function updateText(uint256 _index,string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // change status
    function toggleCompletion(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
