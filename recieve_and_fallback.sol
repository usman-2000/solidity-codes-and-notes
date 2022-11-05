// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// fallback()       jab data bhi bhj rahay hoty hain calldata k box mn tab zrrt hoti iski


contract FALLBACKEXAMPLE{
    uint public result;

    receive() payable external {
        result=1;
    }

    fallback() external payable {
        result = 2;
    }
}
