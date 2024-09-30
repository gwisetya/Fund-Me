// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract SafeMathTester{
    uint8 public bigNumber = 255;

    function add() public returns(uint8){
    uint8 bigNumberBefore = bigNumber; 
    bigNumber = bigNumber + 1;
    require(bigNumber > bigNumberBefore); 
    return bigNumber; 
    }
}