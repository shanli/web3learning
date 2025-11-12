// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
// contract OtherContract {
//     uint256 private _x = 0; // 状态变量_x
//     // 收到eth的事件，记录amount和gas
//     event Log(uint amount, uint gas);
    
//     // 返回合约ETH余额
//     function getBalance() view public returns(uint) {
//         return address(this).balance;
//     }

//     // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
//     function setX(uint256 x) external payable{
//         _x = x;
//         // 如果转入ETH，则释放Log事件
//         if(msg.value > 0){
//             emit Log(msg.value, gasleft());
//         }
//     }

//     // 读取_x
//     function getX() external view returns(uint x){
//         x = _x;
//     }
// }
// contract CallContract{
//     // 定义Response事件，输出call返回的结果success和data
//     event Response(bool success, bytes data);

//     // function callSetX(address _Address, uint256 x) external{
//     //     OtherContract(_Address).setX(x);
//     // }
//     function callSetX(address payable _addr, uint256 x) public payable {
//         // call setX()，同时可以发送ETH
//         (bool success, bytes memory data) = _addr.call{value: msg.value}(
//             abi.encodeWithSignature("setX(uint256)", x)
//         );

//         emit Response(success, data); //释放事件
//     }

//     function callGetX(OtherContract _Address) external view returns(uint x){
//         x = _Address.getX();
//     }

//     function callGetX2(address _Address) external view returns(uint x){
//         OtherContract oc = OtherContract(_Address);
//         x = oc.getX();
//     }
//     function setXTransferETH(address otherContract, uint256 x) payable external{
//         OtherContract(otherContract).setX{value: msg.value}(x);
//     }


// }
// contract OtherContract {
//     uint256 private _x = 0; // 状态变量x
//     // 收到eth的事件，记录amount和gas
//     event Log(uint amount, uint gas);
    
//     fallback() external payable{}

//     // 返回合约ETH余额
//     function getBalance() view public returns(uint) {
//         return address(this).balance;
//     }

//     // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
//     function setX(uint256 x) external payable{
//         _x = x;
//         // 如果转入ETH，则释放Log事件
//         if(msg.value > 0){
//             emit Log(msg.value, gasleft());
//         }
//     }

//     // 读取x
//     function getX() external view returns(uint x){
//         x = _x;
//     }
// }


// contract CallContract{
//     // 定义Response事件，输出call返回的结果success和data
//     event Response(bool success, bytes data);

//    function callSetX(address payable _addr, uint256 x) public payable {
//         // call setX()，同时可以发送ETH
//         (bool success, bytes memory data) = _addr.call{value: msg.value}(
//             abi.encodeWithSignature("setX(uint256)", x)
//         );

//         emit Response(success, data); //释放事件
//     }
//     function callGetX(address _addr) external returns(uint256){
//         // call getX()
//         (bool success, bytes memory data) = _addr.call(
//             abi.encodeWithSignature("getX()")
//         );

//         emit Response(success, data); //释放事件
//         return abi.decode(data, (uint256));
//     }
//     function callNonExist(address _addr) external{
//         // call 不存在的函数
//         (bool success, bytes memory data) = _addr.call(
//             abi.encodeWithSignature("foo(uint256)")
//         );

//         emit Response(success, data); //释放事件
//     }



// }
// 被调用的合约C
contract C {
    uint public num;
    address public sender;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
    }
}
contract B {
    uint public num;
    address public sender;
    // 通过call来调用C的setVars()函数，将改变合约C里的状态变量
    function callSetVars(address _addr, uint _num) external payable{
        // call setVars()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
    // 通过delegatecall来调用C的setVars()函数，将改变合约B里的状态变量
    function delegatecallSetVars(address _addr, uint _num) external payable{
        // delegatecall setVars()
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}
contract TT{
    event LL(uint256 value);
    mapping(uint => address) public idToAddress; // id映射到地址
    mapping(address => address) public swapPair; // 币对的映射，地址到地址

    function writeMap (uint _Key, address _Value) public{
        // emit LL(idToAddress);
        idToAddress[_Key] = _Value;
    }
}