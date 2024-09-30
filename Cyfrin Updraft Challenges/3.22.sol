// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract OnlyAfter{
    uint256 time; 
    
    modifier onlyAfter(uint256 _time){
        require(time >= _time, "not enought time");
        _;
    }
}