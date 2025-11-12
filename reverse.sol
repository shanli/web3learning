// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract Reverse{
    event Log(uint256 len);

    function reverse(string memory str) public returns(string memory reverseStr){
        bytes memory strBytes = bytes(str);
        uint256 len = strBytes.length;
        emit Log(len);

        if (len <= 1) {
            reverseStr = str;
        } else {
            for(uint256 i = 0; i < len / 2; i++) {
                (strBytes[i], strBytes[len - i - 1]) = (
                    strBytes[len - i - 1],
                    strBytes[i]
                );
            }
            reverseStr = string(strBytes);
        }
    }
}