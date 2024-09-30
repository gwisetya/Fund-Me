// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract FundMe{
    address firstAccountRemix = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    function withdrawOnlyFirstAccountRemix() public {
        require(msg.sender == firstAccountRemix, "Not Owner"); 
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "Call failed");
    }
}

