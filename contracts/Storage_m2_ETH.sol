// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Storage_m2_ETH {

    uint public counter = 0; // se define un uint con valor 0
    bool internal isFinished = true; // se define isFinished como verdadero
    address owner = 0x742d35Cc6634C0532925a3b844Bc454e4438f44e;

    enum Estado {
        Pendiente, 
        Aprobado, 
        Rechazado
    }

    function getAddress() public  {

    }
}