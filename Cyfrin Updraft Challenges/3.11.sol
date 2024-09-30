// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5fb1616F78dA7aFC9FF79e0371741a747D2a7F22); 

    function getLatestBTCPriceInEth() public view returns(uint256){
        (,int price,,,)= priceFeed.latestRoundData(); 
        return uint256(price); 
    }
}