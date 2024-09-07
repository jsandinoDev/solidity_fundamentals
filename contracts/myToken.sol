// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;


contract myToken {

    // nombre y simbolo del token
    string name = "sandi_coin";
    string symbol = ":-)";

    // Total supply
    uint256 supply;


    // Balance tracking con un mapping 
    mapping(address => uint256) public trackingBalance;

    // constructor
    constructor(uint256 _supply) {
        trackingBalance[msg.sender] = _supply;
    }


    // eventos para notificar
    // - emit para transferencias, etc

    // modifiers para limitar ciertas funcionalidades

    // funciones de trasnferencia 
    // funciones para aprobar/firmar y trasnferir 

    // compatibilidad con otras redes, otros tokens

    // seguridad

}