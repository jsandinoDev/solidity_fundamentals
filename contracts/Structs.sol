// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Structs {

    enum Cartype {SEDAN, OFFROAD}

    struct Car {
        string brand;
        uint year;
        bool crashed;
        Cartype carType;
    }

    Car public car;
    mapping (address => Car[]) public carMaps;

    function createCar(string memory _brand, uint _year, bool _crashed, Cartype _type) public{
        car = Car(_brand, _year, _crashed, _type);
    }

    function addCarToMap(string memory _brand, uint _year, bool _crashed,Cartype _type) public {
        carMaps[msg.sender].push(Car(_brand, _year, _crashed, _type));
    }

}