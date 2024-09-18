// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Sand_Token is ERC20 {
    constructor(uint256 initialSupply) ERC20("Sand Token", "SAND") {
        _mint(msg.sender, initialSupply);
    }
}