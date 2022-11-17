// SPDX-License-Identifier: None
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.17;

contract SHAMEcoin is ERC20, Ownable {

    constructor(uint256 initialSupply) ERC20("SHAME", "SHM"){
    _mint(msg.sender, initialSupply);
   }
    
    function decimals() public view override returns (uint8) {
        return 0;
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require (amount == 1);
        if (msg.sender == owner()){
            _transfer(owner(), recipient, 1);
        }
        else {
            _transfer(owner(), msg.sender, 1);
        }
        return true;
    }

    function transferFrom(address shameHodler, address DEAD, uint256 amount) public override returns (bool) {
        require (msg.sender == owner());
        uint256 currentAllowance = allowance(shameHodler, owner());
        require(currentAllowance >= 1, "ERC20: transfer amount exceeds allowance");
        _burn(shameHodler, 1);
        _approve(shameHodler, _msgSender(), currentAllowance - 1);

        return true;
    }

       function approve(address hodler, uint256 amount) public override returns (bool) {
        require (msg.sender == hodler);
        _approve(_msgSender(), owner(), amount);
        return true;
    }


   
}