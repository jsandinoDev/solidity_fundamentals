// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Josue Sandino Jaen
// ETH
contract EntregableFinalMod2 {

    // init declarations
    uint fee;
    address private owner;
    uint256 public treasuryBalance;

    struct User {
        string name;
        string lastName;
        uint balance;
        bool isRegistered;
    }

    mapping(address => User) public  users;

    // events
    event UserRegistered(address  indexed userAddress, string indexed firstName, string indexed lastName);
    event Deposit(address indexed userAddress, uint  indexed amount);
    event Withdrawal(address indexed userAddress, uint256  indexed amount, uint256 indexed fee);
    event TreasuryWithdrawal(address indexed owner, uint256 indexed amount);


    // modifiers
     modifier onlyOwner(){
        require(owner == msg.sender, "Only the owner can modify the contract");
        _;
    }

    modifier onlyRegisteredUser(){
        require(users[msg.sender].isRegistered , "Only the registered users can interact with the contract");
        _;
    }

    modifier notRegisteredUser(){
        require(!users[msg.sender].isRegistered , "Only the registered users can interact with the contract");
        _;
    }

    modifier checkBalance(uint _amount){
        require(users[msg.sender].balance >= _amount + fee, "Insufficient balance");
        _;
    }

    modifier checkTreasuryBalance(uint _amount){
        require(treasuryBalance >= _amount, "Insufficient treasury balance");
        _;
    }


    // constructor
     constructor(uint _fee){
        owner = msg.sender;
        fee = _fee;
    }

    // functions
    function register(string calldata _firstName, string calldata _lastName) notRegisteredUser external {
        users[msg.sender] = User(_firstName, _lastName, 0, true);
        emit UserRegistered(msg.sender, _firstName, _lastName);
    }

    function deposit(uint _amount) onlyRegisteredUser external payable  {
        users[msg.sender].balance += _amount;
        emit Deposit(msg.sender, _amount);
    }

    function getBalance() onlyRegisteredUser external view returns (uint) {
        return users[msg.sender].balance;
    }

    function withdraw(uint256 _amount)  onlyRegisteredUser external{
        uint256 newFee = (_amount * fee) / 10000;
        uint256 netAmount = _amount - newFee;
        require(users[msg.sender].balance >= _amount, "Insufficient balance");
        
        users[msg.sender].balance -= _amount;
        treasuryBalance += newFee;

        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send Ether");
        emit Withdrawal(msg.sender, netAmount, newFee);
    }

    function withdrawTreasury(uint256 _amount) checkTreasuryBalance(_amount) onlyOwner external {
        treasuryBalance -= _amount;
        (bool sent, ) = owner.call{value: _amount}("");
        require(sent, "Failed to send Ether");
        emit TreasuryWithdrawal(owner, _amount);
    }

    receive() external payable {}
}

