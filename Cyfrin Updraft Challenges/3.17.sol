// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract PushNumbers {
    uint256[] public numbers;

    function pushNumbers() public{
        uint256 index; 
        for(index = 0; index < 10; index++) {
            numbers.push(index+1);
        }
    }
}
