// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Counter {
    uint public counter;

    function setCounter() public {
        counter++;
    }

    function getCounter() public view returns (uint) {
        return  counter;
    }
}