// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Clase2Modulo2{
    string public name;
    string public lastName;
    address private owner;

    string[] names;

    constructor(){
        owner = msg.sender;
    }

    event DataModified(address indexed editor, string indexed key, string value);

    modifier onlyOwner {
        require(owner == msg.sender, "Only the owner can modify the contract");
        _;
    }

    modifier checkNamesLenght(uint _index){
        require(_index < names.length, "Index out of bounds");
        _;
    }

    function setName(string memory _name) onlyOwner public  {
        emit DataModified(msg.sender, "Name", _name);
        name = _name;
        names.push(_name);
    }

    function setLastName(string memory _lastName) onlyOwner public {
        emit DataModified(msg.sender, "LastName", _lastName);
        lastName=_lastName;
    }

    function readNames(uint _index) checkNamesLenght(_index) public view returns (string memory){
        return names[_index];
    }

    function editNameArray(uint _index, string memory _newName) checkNamesLenght(_index) public {
        names[_index] = _newName;
    }

    function deleteLastElement() public returns(string[] memory){
        emit DataModified(msg.sender, "Name", names[names.length - 1]);
        names.pop(); 
        return names;
    } 

}