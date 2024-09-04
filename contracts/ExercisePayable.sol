// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract ExercisePayable {
    mapping(address => uint) public balances;
    uint fee;
    uint public treasury;

    // struct User{
    //     string name
    //     uint saldo;
    // }

    // mapping(address => User) public users;

    constructor(uint _fee){
        fee= _fee;
    }

    function addValueToUser() public{
        balances[msg.sender] = 1000;
    }

    function getValueFromUser() public view returns(uint){
        return balances[msg.sender];
    }

    function sendValueToUser() public payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdrawBalance(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insuficient funds");
        uint feeAmount = _amount * fee / 100;
        payable(msg.sender).transfer(_amount - feeAmount);
        balances[msg.sender] -= _amount;
        treasury += feeAmount;
    }
}