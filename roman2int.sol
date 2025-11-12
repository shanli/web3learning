// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract Int2Roman{

    event Log(uint256 num);
    // CDLVI：456
	 mapping(bytes1 => uint256) public romanMap;
     constructor() {
        // 初始化映射表
        romanMap['I'] = 1;
        romanMap['V'] = 5;
        romanMap['X'] = 10;
        romanMap['L'] = 50;
        romanMap['C'] = 100;
        romanMap['D'] = 500;
        romanMap['M'] = 1000;
    }
    function validRoman(string memory roman) public view returns (bool)  {
        bytes memory romanBytes = bytes(roman);
        if (romanBytes.length == 0) return false;
        
        for (uint256 i = 0; i < romanBytes.length; i++) {
            if (romanMap[romanBytes[i]] == 0) {
                return false;
            }
        }
        return true;
    }
    function romanToInt(string memory roman) public view returns (uint256) {
        bytes memory romanBytes = bytes(roman);
        require(romanBytes.length > 0, "Empty Roman numeral");
        require(validRoman(roman), "please input correct Roman numeral");
        
        uint256 result = 0;
        uint256 prevValue = 0;
       
        // 从右向左遍历（更容易处理减法规则）
        for (uint256 i = romanBytes.length; i > 0; i--) {
            bytes1 currentChar = romanBytes[i - 1];
            uint256 currentValue = getValue(currentChar);
            
            // 应用罗马数字规则：小数字在大数字前表示减法
            if (currentValue < prevValue) {
                result -= currentValue;
            } else {
                result += currentValue;
            }
            
            prevValue = currentValue;
        }
        
        return result;
    }
    function getValue(bytes1 romanChar) public view returns (uint256) {
        uint256 value = romanMap[romanChar];
        require(value > 0, "Invalid Roman character");
        return value;
    }
}