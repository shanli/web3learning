// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract hash1{
    bytes32 _msg = keccak256(abi.encodePacked("0xAA"));
    function hash(
        uint _num,
        string memory _string,
        address _addr
        ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_num, _string, _addr));
    }
    // 弱抗碰撞性
    function weak(
        string memory string1
        )public view returns (bool){
        return keccak256(abi.encodePacked(string1)) == _msg;
    }
    // 强抗碰撞性
    function strong(
            string memory string1,
            string memory string2
        )public pure returns (bool){
        return keccak256(abi.encodePacked(string1)) == keccak256(abi.encodePacked(string2));
    }

}
// 0x1e39ae6c0ee93aa18d5cd24edc76f3b92d408fdb7b2e215a435241aebb9de661