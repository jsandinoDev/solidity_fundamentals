// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Ejercicio1Clase2Mod2 {
    string[] private storedInfos;
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "Only the owner can modify the contract");
        _;
    }

    modifier checkSoredInfosLength(uint _index){
        require(_index < storedInfos.length, "Index out of bounds");
        _;
    }

    event DataModified(address indexed editor, string key, string value);

    function add(string memory _myInfo) onlyOwner external returns (uint index) {
        storedInfos.push(_myInfo);
        index = storedInfos.length -1;
        emit DataModified(msg.sender, "OBJECT ADDED", _myInfo);
    }

    function update(uint _index, string memory newInfo) onlyOwner checkSoredInfosLength (_index) external {
        storedInfos[_index] = newInfo;
    }

    function getOne(uint _index) checkSoredInfosLength(_index) external view returns (string memory) {
        return storedInfos[_index];
    }

    function listAll() external view returns (string[] memory) {
        return storedInfos;
    } 
}