// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract storageConcepts{
    string[] public progLang = ["python","java","php a bridge to connect"];

    function changeValInMemory() public view{
        string[] memory p1 = progLang; // jab hm memory ka keyword use krengay to wo array ki aik copy banaye ga or usmn changings kryga ...original array ko disturb nahi kryga or gas bhi cost nahi kry ga.
        p1[0] = "Kotlin";
    }

    function changeValInStorage() public {
        string[] storage p1 = progLang; //jab hm storage ko use krengay to aik to wo value state pr change kr day ga dosra gas bhi cost kry ga.
        p1[0] = "Kotlin";

    }
}
