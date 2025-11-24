// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint8 private immutable _decimals;
    constructor(string memory _name, string memory _symbol, uint8 decimals_) ERC20(_name, _symbol){
        _decimals = decimals_;
    }
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
    function burn(address from, uint256 amount) external {
        _burn(from, amount);
    }
    function decimals() public view override returns(uint8)  {
        return _decimals;
    }
}