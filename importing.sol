// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Mapping.sol";

contract Importing_a_Contract{
    MAPPINGS public  mappings;

    function createMappingsContract() public {
        mappings = new MAPPINGS();
    }


}


contract Importing_a_Contract_Array{
    MAPPINGS[] public mappingsArray;

    function createMappingsContract() public {
        MAPPINGS mappings = new MAPPINGS();
        mappingsArray.push(mappings);
    }
}
