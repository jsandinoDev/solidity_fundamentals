// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Clase2Modulo2{
    string public name;
    string public lastName;
    address private owner;
    string[] names;
    // calldata -> mejor para leet (menos gas)

    constructor() {
        owner = msg.sender; // primera persona que ejecute el contrato 
                            // constructor se ejecuta cuando se hace deploy del contrato
    }

    event DataModified(address indexed editor, string key, string value);
    // entre mas index mas caro el gas, max 3 indx por evento

    
    modifier onlyOwner(){
        require(owner == msg.sender, "Only the owner can modify the contract");
        _;
    }

    function setName(string memory _name) onlyOwner public { // al poner el modifier ahi 
                                                            // revisa que sea el owner y luego ejecuta
        emit DataModified(msg.sender, "Name", _name);
        name = _name;
        names.push(_name);
    }
    function setLastName(string memory _lastName) onlyOwner public {
        emit DataModified(msg.sender, "LastName", _lastName);
        lastName = _lastName;
    }

    function readName(uint _index) checkNamesLength(_index) public  view returns  (string memory){
        return names[_index];
    }   

    function editNameArray(uint _index, string memory _newName) checkNamesLength(_index) public  {
        names[_index] = _newName;
    }
    

    modifier checkNamesLength(uint _index){
        require(_index < names.length, "Index out of bounds");
        _;
    }

    function deleteLastElement() public returns(string[] memory){
		emit DataModified(msg.sender, "Name", names[names.length - 1]);
        names.pop(); 
		return names;  
    } 

}