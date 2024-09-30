// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ExpensiveReset{
    uint256[] public numbers;

    function pushNumbers() public{
        uint256 index; 
        for(index = 0; index < 10; index++) {
            numbers.push(index+1);
        }
    }

    function expensiveReset() public{
        uint256 index; 
        for(index = 0; index < 10; index++) {
            numbers[index] = 0;
        }
    }
}