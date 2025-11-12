// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract Int2Roman{
    struct ValueSymbols {
        uint value;
        string symbol;
    }
    ValueSymbols[] public valueSymbols;
    uint256[] private values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    string[] private symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

    event Log(uint256 num);
    // constructor(){
    //     valueSymbols.push(ValueSymbols(1000, "M"));
    //     valueSymbols.push(ValueSymbols(900, "CM")); 
    //     valueSymbols.push(ValueSymbols(500, "D")); 
    //     valueSymbols.push(ValueSymbols(400, "CD")); 
    //     valueSymbols.push(ValueSymbols(100, "C")); 
    //     valueSymbols.push(ValueSymbols(90, "XC")); 
    //     valueSymbols.push(ValueSymbols(50, "L")); 
    //     valueSymbols.push(ValueSymbols(40, "XL")); 
    //     valueSymbols.push(ValueSymbols(10, "X")); 
    //     valueSymbols.push(ValueSymbols(9, "IX")); 
    //     valueSymbols.push(ValueSymbols(5, "V"));
    //     valueSymbols.push(ValueSymbols(4, "IV")); 
    //     valueSymbols.push(ValueSymbols(1, "I")); 
    // }
   
    function int2Roman(uint256 _num) public returns(string memory romanStr){
        require(_num > 0 && _num < 4000, "Number must be between 1 and 3999");
        // for (uint i = 0; i < valueSymbols.length; i++) {
        //     uint256 keyValue = valueSymbols[i].value;
        //     string memory symbolValue = valueSymbols[i].symbol;
        //     emit Log(keyValue);
        // }
        require(_num > 0 && _num < 4000, "Number must be between 1 and 3999");
        
        bytes memory roman;
        
        for (uint256 i = 0; i < values.length; i++) {
            while (_num >= values[i]) {
                roman = abi.encodePacked(roman, symbols[i]);
                _num -= values[i];
            }
        }
        return string(roman);
    }
}