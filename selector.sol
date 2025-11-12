// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract selector{
    // event 返回msg.data
    event Log(bytes data);

    function mint(address to) external{
        emit Log(msg.data);
    }
    function mintSelector() external pure returns(bytes4 mSelector){
        return bytes4(keccak256("mint(address)"));
    }
    // elementary（基础）类型参数selector
    // 输入：param1: 1，param2: 0
    // elementaryParamSelector(uint256,bool) : 0x3ec37834
    // function elementaryParamSelector(uint256 param1, bool param2) external returns(bytes4 selectorWithElementaryParam){
    //     emit SelectorEvent(this.elementaryParamSelector.selector);
    //     return bytes4(keccak256("elementaryParamSelector(uint256,bool)"));
    // }
// fixed size（固定长度）类型参数selector
    // 输入： param1: [1,2,3]
    // fixedSizeParamSelector(uint256[3]) : 0xead6b8bd
    // function fixedSizeParamSelector(uint256[3] memory param1) external returns(bytes4 selectorWithFixedSizeParam){
    //     emit SelectorEvent(this.fixedSizeParamSelector.selector);
    //     return bytes4(keccak256("fixedSizeParamSelector(uint256[3])"));
    // }
// non-fixed size（可变长度）类型参数selector
    // 输入： param1: [1,2,3]， param2: "abc"
    // nonFixedSizeParamSelector(uint256[],string) : 0xf0ca01de
    // function nonFixedSizeParamSelector(uint256[] memory param1,string memory param2) external returns(bytes4 selectorWithNonFixedSizeParam){
    //     emit SelectorEvent(this.nonFixedSizeParamSelector.selector);
    //     return bytes4(keccak256("nonFixedSizeParamSelector(uint256[],string)"));
    // }
    
}