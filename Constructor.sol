// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// A constructor is an optional function that is executed upon contract creation.
// A constructor is only executable once, Call only once when smart contract is deployed.
// After the deployement there is no way to call a constructor again
// Use only two keywords :public and internal
// Cannot call a constructor through a function but can be called a function in a constructor


struct Instructor{
    string name;
    uint age;
    address addr;
}

contract Academy{
    Instructor public MathInstructor;

    constructor(string memory _name,uint _age) {
        MathInstructor.name = _name;
        MathInstructor.age = _age;
        MathInstructor.addr = msg.sender;
    }
}
