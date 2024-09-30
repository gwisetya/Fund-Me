// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
    uint256 immutable MINIMUM_USD = 5;
    address[] funders;
    mapping(address=>uint256) addressToAmountFunded; 
    mapping(address=>uint256) contributionCount; 

    function fund() public payable {
        require(getConversionRate(msg.value) >= MINIMUM_USD, "less than 5 dollars sent");
        funders.push(msg.sender); 
        addressToAmountFunded[msg.sender] += msg.value; 
        contributionCount[msg.sender] +=1; 
    }
    // owner can withdraw funds
    /*function withdraw() public {}*/

    // Function to get the price of Ethereum in USD
    function getPrice() public view returns(uint) {
    (,int price,,,) = priceFeed.latestRoundData();
    return uint(price) * 1e10;
    }

    // Function to convert a value based on the price
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice*ethAmount)/ 1e18;
        return ethAmountInUSD; 
    }
}