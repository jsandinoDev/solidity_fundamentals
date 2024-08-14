// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Counter {
    uint public counter;
    address public owner;
    string public storedInfo;
    uint public countChanges;

    constructor(uint256 _counter) {
        counter= _counter;
        owner = msg.sender;
    }

    function setCounter(uint _counter) public {
        counter = _counter;
    }

    function addCounter() public {
        counter+=1;
    }

    function getCounter() public view returns (uint){
        return counter;
    }
}
