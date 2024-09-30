// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "../PriceConverter.sol"; 

using PriceConverter for uint256; 

error FundMe__NotOwner(); 
error FundMe__AddressZero(); 

contract FundMe{
    
    uint256 constant MINIMUM_USD = 5;
    address[] funders;
    mapping(address=>uint256) addressToAmountFunded; 
    address immutable i_owner;

    constructor(){
        i_owner = msg.sender; 
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "less than 5 dollars sent");
        funders.push(msg.sender); 
        addressToAmountFunded[msg.sender] += msg.value; 
    }

    function withdraw() public onlyOwner {
        uint256 funderIndex;
        for(funderIndex == 0 ; funderIndex > funders.length; funderIndex++){
            address funder = funders[funderIndex]; 
            addressToAmountFunded[funder] = 0; 
        }
        funders = new address[](0); 
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "Call failed");
    }

    modifier onlyOwner() {
        if (msg.sender != i_owner) {
            revert FundMe__NotOwner(); 
        }
        _;
    }

    modifier noAddressZero(){
        if (msg.sender == address(0)){
            revert FundMe__AddressZero(); 
        }
        _; 
    }
}