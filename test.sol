// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract Yeye{
    // mapping(address => uint256) public override balanceOf;
    event Log(string msg);

    // 定义3个function: hip(), pop(), yeye()，Log值为Yeye。
    function hip() public virtual{
        emit Log("Yeye");
    }

    function pop() public virtual{
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }
}
contract BB is Yeye{
    function hip() public virtual override{
        emit Log("Baba");
    }

    function pop() public virtual override{
        emit Log("Baba");
    }

    function baba() public virtual{
        emit Log("Baba");
    }
}
contract Erzi is Yeye, BB{
    // 继承两个function: hip()和pop()，输出值为Erzi。
    function hip() public virtual override(Yeye, BB){
        emit Log("Erzi");
    }

    function pop() public virtual override(Yeye, BB) {
        emit Log("Erzi");
    }
    function callParent() public{
        Yeye.pop();
    }
    function callParentSuper() public{
        // 将调用最近的父合约函数，Baba.pop()
        super.pop();
    }


} 