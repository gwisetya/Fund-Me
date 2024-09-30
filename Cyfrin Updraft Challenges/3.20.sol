// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract FundMe{
    
    function callAmountTo(address _recipient) public {

        (bool success, ) = payable(_recipient).call{value: address(this).balance}("");
        require(success, "Call failed");
    }
}