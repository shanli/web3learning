// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
// contract HelloWeb3{
//     string public _string = "Hello Web3!";
//     // 地址
//     address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
//     address payable public _address1 = payable(_address); // payable address，可以转账、查余额
//     // 地址类型的成员
//     uint256 public balance = _address1.balance; // balance of address
//     // 整型
//     int public _int = -1; // 整数，包括负数
//     uint public _uint = 1; // 无符号整数
//     uint256 public _number = 20220330; // 256位无符号整数

//     // 整数运算
//     uint256 public _number1 = _number + 1; // +，-，*，/
//     uint256 public _number2 = 2**2; // 指数
//     uint256 public _number3 = 7 % 2; // 取余数
//     bool public _numberbool = _number2 > _number3; // 比大小
//     // 固定长度的字节数组
//     bytes32 public _byte32 = "MiniSolidity"; 
//     bytes1 public _byte = _byte32[0]; 
//     // 用enum将uint 0， 1， 2表示为Buy, Hold, Sell
//     enum ActionSet { Buy, Hold, Sell }
//     // 创建enum变量 action
//     ActionSet action = ActionSet.Sell;

//     // enum可以和uint显式的转换
//     function enumToUint() external view returns(uint){
//         return uint(action);
//     }

// }
// contract FunctionTypes {
//     // uint256 public number = 5;
//     // // pure: 纯纯牛马
//     // function addPure(uint256 _number) external pure returns(uint256 new_number){
//     //     new_number = _number + 1;
//     // }
//     // // // view: 看客
//     // function addView() external view returns(uint256 new_number) {
//     //     new_number = number + 1;
//     // }
//     // // Now `addPure` is declared before being used
//     // // function testAddPure() external view returns(uint256) {
//     // //     return addPure(number); 
//     // // }
//     // function add() internal {
//     //     number = number + 1;
//     // }
//     // // 合约内的函数可以调用内部函数
//     // function addCall() external {
//     //     add();
//     // }
//     // // internal: 内部函数
//     // function minus() internal {
//     //     number = number - 1;
//     // }

//     // // 合约内的函数可以调用内部函数
//     // function minusCall() external {
//     //     minus();
//     // }
//     // // payable: 递钱，能给合约支付eth的函数
//     // function minusPayable() external payable returns(uint256 balance) {
//     //     minus();    
//     //     balance = address(this).balance;
//     // }
//     // // 返回多个变量
//     // function returnMultiple() public pure returns(uint256, bool, uint256[3] memory){
//     //     return(1, true, [uint256(1),2,5]);
//     // }
//     // // 命名式返回
//     // function returnNamed() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
//     //     _number = 2;
//     //     _bool = false;
//     //     _array = [uint256(3),2,1];
//     // }
//     // function readReturn() public pure{
//     //     uint256 _number;
//     //     bool _bool;
//     //     bool _bool2;
//     //     uint256[3] memory _array;
//     //     (_number, _bool, _array) = returnNamed();
//     //     (, _bool2, ) = returnNamed();
//     // }
//     // uint[] x = [1,2,3]; // 状态变量：数组 x

//     // function fStorage() public{
//     //     //声明一个storage的变量 xStorage，指向x。修改xStorage也会影响x
//     //     uint[] storage xStorage = x;
//     //     xStorage[0] = 100;
//     // }

//     // function global() external view returns(address, uint, bytes memory){
//     //     address sender = msg.sender;
//     //     uint blockNum = block.number;
//     //     bytes memory data = msg.data;
//     //     return(sender, blockNum, data);
//     // }
//     // function weiUnit() external pure returns(uint) {
//     //     assert(1 wei == 1e0);
//     //     assert(1 wei == 1);
//     //     return 1 wei;
//     // }

//     // function gweiUnit() external pure returns(uint) {
//     //     assert(1 gwei == 1e9);
//     //     assert(1 gwei == 1000000000);
//     //     return 1 gwei;
//     // }

//     // function etherUnit() external pure returns(uint) {
//     //     assert(1 ether == 1e18);
//     //     assert(1 ether == 1000000000000000000);
//     //     return 1 ether;
//     // }

//     // function secondsUnit() external pure returns(uint) {
//     //     assert(1 seconds == 1);
//     //     return 1 seconds;
//     // }

//     // function minutesUnit() external pure returns(uint) {
//     //     assert(1 minutes == 60);
//     //     assert(1 minutes == 60 seconds);
//     //     return 1 minutes;
//     // }

//     // function hoursUnit() external pure returns(uint) {
//     //     assert(1 hours == 3600);
//     //     assert(1 hours == 60 minutes);
//     //     return 1 hours;
//     // }

//     // function daysUnit() external pure returns(uint) {
//     //     assert(1 days == 86400);
//     //     assert(1 days == 24 hours);
//     //     return 1 days;
//     // }

//     // function weeksUnit() external pure returns(uint) {
//     //     assert(1 weeks == 604800);
//     //     assert(1 weeks == 7 days);
//     //     return 1 weeks;
//     // }
//     // 结构体
//     // struct Student{
//     //     uint256 id;
//     //     uint256 score; 
//     // }

//     // Student student; // 初始一个student结构体

//     //  给结构体赋值
//     // 方法1:在函数中创建一个storage的struct引用
//     // function initStudent1() external{
//     //     Student storage _student = student; // assign a copy of student
//     //     _student.id = 11;
//     //     _student.score = 100;
//     // }

//     // // 方法2:直接引用状态变量的struct
//     // function initStudent2() external{
//     //     student.id = 1;
//     //     student.score = 80;
//     // }
//     // // 方法3:构造函数式
//     // function initStudent3() external {
//     //     student = Student(3, 90);
//     // }
//     // // 方法4:key value
//     // function initStudent4() external {
//     //     student = Student({id: 4, score: 60});
//     // }
//     // 我们定义一个结构体 Struct
//     // struct Student{
//     //     uint256 id;
//     //     uint256 score; 
//     // }
//     // mapping(Student => uint) public testVar;
//     // mapping(uint => address) public idToAddress; // id映射到地址
//     // mapping(address => address) public swapPair; // 币对的映射，地址到地址

//     // function writeMap (uint _Key, address _Value) public{
//     //     idToAddress[_Key] = _Value;
//     // }


//     // bool public _bool; // false
//     // string public _string; // ""
//     // int public _int; // 0
//     // uint public _uint; // 0
//     // address public _address; // 0x0000000000000000000000000000000000000000

//     // enum ActionSet { Buy, Hold, Sell}
//     // ActionSet public _enum; // 第1个内容Buy的索引0

//     // function fi() internal{} // internal空白函数
//     // function fe() external{} // external空白函数 

//     // // Reference Types
//     // uint[8] public _staticArray; // 所有成员设为其默认值的静态数组[0,0,0,0,0,0,0,0]
//     // uint[] public _dynamicArray; // `[]`
//     // mapping(uint => address) public _mapping; // 所有元素都为其默认值的mapping
//     // // 所有成员设为其默认值的结构体 0, 0
//     // struct Student{
//     //     uint256 id;
//     //     uint256 score; 
//     // }
//     // Student public student;
//     // // delete操作符
//     // bool public _bool2 = true; 
//     // function d() external {
//     //     delete _bool2; // delete 会让_bool2变为默认值，false
//     // }
//     // 插入排序 正确版
//     function insertionSort(uint[] memory a) public pure returns(uint[] memory) {
//         // note that uint can not take negative value
//         for (uint i = 1;i < a.length;i++){
//             uint temp = a[i];
//             uint j=i;
//             while( (j >= 1) && (temp < a[j-1])){
//                 a[j] = a[j-1];
//                 j--;
//             }
//             a[j] = temp;
//         }
//         return(a);
//     }

// }
// contract Owner {
//     address public owner;
//     constructor(address initialOwner) {
//         owner = initialOwner;
//     }
//     modifier onlyOwner {
//         require(msg.sender == owner);
//         _;
//     }
//     function changeOwner(address _newOwner) external onlyOwner{
//         owner = _newOwner;
//     }
// }
// contract Events {
//     mapping(address => uint256) public _balances;
//     event Transfer(address indexed  from, address indexed  to, uint256 value);
//     // 定义_transfer函数，执行转账逻辑
//     function _transfer(
//         address from,
//         address to,
//         uint256 amount
//     ) external {

//         _balances[from] = 10000000; // 给转账地址一些初始代币

//         _balances[from] -=  amount; // from地址减去转账数量
//         _balances[to] += amount; // to地址加上转账数量

//         // 释放事件
//         emit Transfer(from, to, amount);
//     }

// }

contract Base1 {
    modifier exactDividedBy2And3(uint _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
}

contract Identifier is Base1 {

    //计算一个数分别被2除和被3除的值，但是传入的参数必须是2和3的倍数
    function getExactDividedBy2And3(uint _dividend) public exactDividedBy2And3(_dividend) pure returns(uint, uint) {
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    //计算一个数分别被2除和被3除的值
    function getExactDividedBy2And3WithoutModifier(uint _dividend) public pure returns(uint, uint){
        uint div2 = _dividend / 2;
        uint div3 = _dividend / 3;
        return (div2, div3);
    }
}
// 构造函数的继承
abstract contract A {
    uint public a;

    constructor(uint _a) {
        a = _a;
    }
}
contract C is A {
    constructor(uint _c) A(_c * _c) {}
}
contract God {
    event Log(string message);

    function foo() public virtual {
        emit Log("God.foo called");
    }

    function bar() public virtual {
        emit Log("God.bar called");
    }
}

contract Adam is God {
    function foo() public virtual override {
        emit Log("Adam.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Adam.bar called");
        super.bar();
    }
}

contract Eve is God {
    function foo() public virtual override {
        emit Log("Eve.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}

contract people is Adam, Eve {
    function foo() public override(Adam, Eve) {
        super.foo();
    }

    function bar() public override(Adam, Eve) {
        super.bar();
    }
}
// abstract contract Base{
//     string public name = "Base";
//     function getAlias() public pure virtual returns(string memory);
// }
// contract BaseImpl is Base{
//     function getAlias() public pure override returns(string memory) {
//         return "BaseImpl";
//     }
// }
interface Base {
    function getFirstName() external pure returns(string memory);
    function getLastName() external pure returns(string memory);

}
contract BaseImpl is Base {
    function getFirstName() external  pure override returns(string memory){
        return "Amazing";
    }
    function getLastName() external  pure override returns(string memory){
        return "Ang";
    }
    // function transferOwner1(uint256 tokenId, address newOwner) public {
    //     if(_owners[tokenId] != msg.sender){
    //         revert TransferNotOwner();
    //         // revert TransferNotOwner(msg.sender);
    //     }
    //     _owners[tokenId] = newOwner;
    // }
    // function transferOwner3(uint256 tokenId, address newOwner) public {
    //     assert(_owners[tokenId] == msg.sender);
    //     _owners[tokenId] = newOwner;
    // }

}
contract Overloading{
    function saySomething() public pure returns(string memory){
        return("Nothing");
    }

    function saySomething(string memory something) public pure returns(string memory){
        return(something);
    }
    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }


}
import "@openzeppelin/contracts/utils/Strings.sol";
contract Lib{
    // 利用using for指令
    // using Strings for uint256;
    // function getString1(uint256 _number) public pure returns(string memory){
    //     // 库合约中的函数会自动添加为uint256型变量的成员
    //     return _number.toHexString();
    // }
    // 直接通过库合约名调用
    function getString2(uint256 _number) public pure returns(string memory){
        return Strings.toHexString(_number);
    }

}
contract AA{
    // 定义事件
    event Received(address Sender, uint Value);
    // 接收ETH时释放Received事件
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    event fallbackCalled(address Sender, uint Value, bytes Data);

    // fallback
    fallback() external payable{
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }

}