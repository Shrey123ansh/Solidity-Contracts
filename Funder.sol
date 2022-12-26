// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Funder{
    address payable public owner;
    uint256 public totalFunding;
    mapping(address=>uint256) funder;
    uint256 public no_ofFunders;

    constructor(){
        owner= payable(msg.sender);
    }

    function payFund() public payable{
        require(msg.value>=1 ether,"Invalid Amount");
        if(funder[msg.sender]==0){
            no_ofFunders+=1;
        }
        funder[msg.sender] +=msg.value;
        totalFunding+=msg.value;
    }

    function transferFunds() public{
        require (msg.sender==owner,"Only owner can transfer");
        owner.transfer(address(this).balance);
    }
}