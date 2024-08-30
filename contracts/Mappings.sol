// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Mappings {
    mapping(address => bool) public whitelist;
    string public name;

    mapping(address => uint) public balances;


    modifier checkIsInWhiteList{
        require(whitelist[msg.sender] == true, "Not part of the whitelist");
        _;
    }

    function addToWhitelist(address _userAddress) public  {
        whitelist[_userAddress] = true;
    }

    function setName(string memory _name) checkIsInWhiteList public {
        name = _name;
    }

    function removeFromWhitelist(address _userAddress) checkIsInWhiteList public  {
         whitelist[_userAddress] = false;
    }

    // -------

    function addBalance(address _userAddress, uint _balance) public {
        balances[_userAddress] = _balance;
    }
}