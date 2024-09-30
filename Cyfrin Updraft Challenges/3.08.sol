// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    function getDecimals() public view returns (uint256) {
        return AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419).decimals();
    }  
}