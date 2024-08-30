// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract PayableTest {
  
    // msg.sender -> address de quien ejecuta el contratoç√
    // msg.value -> valor que se esta enviando al contrato
    // msg.data -> 


    event ReceiveFunds(uint indexed value);


    // Function to receive Ether. msg.data must be empty
    receive() external payable {
    }

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    // transfer
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
        // address.transfer(value)
    }

    // send
    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    // call
    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function getBalance() public view returns (uint) {
        address contractAddress = address(this); // address del contracto actual
        return contractAddress.balance;
    }

    function withdraw(uint _amount) public {
        require(_amount <= address(this).balance, "Insufficient balance");
        payable(msg.sender).transfer(_amount);
    }

    function withdrawToUser(uint _amount, address _userAddress) public {
        require(_amount <= address(this).balance, "Insufficient balance");
        payable(_userAddress).transfer(_amount);
    }

    
     function deposit() public payable { // cualquier funcion con payable puede recibir fondos
        // Lógica para manejar el depósito de Ether
        
    }

    // Receive: La función receive se usa para manejar transferencias 
    // directas de Ether al contrato que no contienen datos, como cuando 
    //alguien simplemente envía Ether a la dirección del contrato.

    //Deposit se usa cuando se quiere que los usuarios puedan enviar fondos 
    //al contrato y generalmente se asocia a alguna lógica específica,
    // como actualizar saldos internos, emitir tokens, etc.


    // mapping address => value
    // withdrawUserFunds
    // require fundsForUser[msg.value] >= fundtoWithDraw

}