// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Mappings {
    mapping(address => bool) public whitelist;
    string public name;
    function addToWhitelist(address _userAddress) public  {

        whitelist[_userAddress] = true;
    }

    function setName(string memory _name) public {
        require(whitelist[msg.sender] == true, "Not part of the whitelist");
        name = _name;
    }
}