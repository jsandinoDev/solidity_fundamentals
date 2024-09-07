// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract sandi_coin {
    // name && symbol declaration
    string constant public  name = "SandiCoin";
    string constant public symbol = "SAND";
    uint8 public decimals = 18;

    // Events to notify the trasnfer and approval of a transaction
    event Transfer(address indexed  origin, address indexed  destiny, uint256 value);
    event Approval(address indexed owner, address indexed  spender, uint256 value);

    // mappings to store the balance and the allowed
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;

    // total supply of the Token
    uint256 total_supply;

    // constructor, init the value of the total supply
    constructor(uint256 value) {
        total_supply  = value;
        balances[msg.sender] = total_supply;
    }

    // function to return the total supply 
    function totalSupply() public view returns (uint256) {
        return total_supply;
    }

    // function to return the balance of the requesting token
    function balanceOf(address token) public view returns (uint256) {
        return balances[token];
    }

    // function to approve the transaction
    function approve(address delegate, uint256 numTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    // function to get the allowed mapping
    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }


    // function to send tokens to the supply to a user
    function transfer(address receiver, uint256 numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender] - numTokens;
        balances[receiver] = balances[receiver] + numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    // function tokens from any users that have already tokens
    function transferFrom(address owner, address buyer, uint256 numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner] - numTokens;
        allowed[owner][msg.sender] = allowed[owner][msg.sender] - numTokens;
        balances[buyer] = balances[buyer] + numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }

}