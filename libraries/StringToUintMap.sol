pragma solidity ^0.4.15;

library StringToUintMap {
    struct Data {
        mapping (bytes32 => uint8) map;
    }

    function insert(Data storage self, string key, uint8 value) public {
        require(bytes(key).length <= 32);

        self.map[stringToBytes32(key)] = value;
    }

    function get(Data storage self, string key) public returns (uint8) {
        require(bytes(key).length <= 32);

        return self.map[stringToBytes32(key)];
    }

    function stringToBytes32(string memory source) private returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            // If the string is empty then return 0
            return 0x0;
        }

        // There is no way in solidity to convert string to bytes32,
        // it can only be done in assembly.
        assembly {
            result := mload(add(source, 32))
        }
    }
}