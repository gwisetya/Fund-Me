// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);

    function getPrice() public view returns(uint) {
    (,int price,,,) = priceFeed.latestRoundData();
    return uint(price) * 1e10;
    }

    // Function to convert a value based on the price
    function convertUsdToEth(uint256 usdAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 usdAmountInEth = (usdAmount * 1e36) / ethPrice;
        return usdAmountInEth; 
    }
}
