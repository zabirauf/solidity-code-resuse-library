pragma solidity ^0.4.15;

import { StringToUintMap } from "../libraries/StringToUintMap.sol";

contract PersonsAge {

    StringToUintMap.Data private _stringToUintMapData;

    event GetPersonAgeResponse(string name, uint8 age);

    function addPersonAge(string name, uint8 age) public {
        StringToUintMap.insert(_stringToUintMapData, name, age);
    }

    function getPersonAge(string name) public returns (uint8) {
        uint8 age = StringToUintMap.get(_stringToUintMapData, name);

        GetPersonAgeResponse(name, age);

        return age;
    }
}