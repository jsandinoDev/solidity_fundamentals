// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;
contract StorageJ {
    string storedInfo;
    uint public countChanges = 0;
    address public lastExec;
    address owner;

    constructor(string memory _counter) {
        storedInfo= _counter;
        owner = msg.sender;
    }

    function setStoredInfo(string memory _counter) public {
        require(msg.sender == owner , "Only by the owner");
        require(countChanges < 5, "The counter less than 5");
        storedInfo = _counter;
        countChanges += 1;
        lastExec = msg.sender;
    }

    function getStoredInfo() public view returns (string memory){
        return storedInfo;
    }
}