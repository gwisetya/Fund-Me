// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract TinyTip{
    function tinyTip() public payable{
        require(msg.value > 1e9); 
    }
}