// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {MathLibrary} from "Cyfrin Updraft Challenges/3.15/MathLibrary.sol"; 

using MathLibrary for uint256;

contract FundMe{
    function addTwoNumbers(uint256 A, uint256 B) public pure returns(uint256) {
        return A.sum(B); 
    }
}