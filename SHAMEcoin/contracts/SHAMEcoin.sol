// SPDX-License-Identifier: None
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

pragma solidity ^0.8.0;

contract VolcanoCoin is Ownable, ERC20 {

    
    uint256 supply = 10000;
    event changeSupply(uint256 indexed);
    event transferbb(address, uint256, address);
    

    constructor(uint256 initialSupply) ERC20("SHAME", "SHM"){
    owner()= msg.sender;
    _mint(owner(), initialSupply);
   }

    payment[] public transfers;
    mapping(address => payment[]) public pmtTracking;
    
    function decimals() public view virtual override returns (uint8) {
        return 0;
    }

    function transfer(address recipient) public virtual override returns (bool) {
        if msg.sender = owner(){
            _transfer(owner(), recipient, 1)
        }
        else {
            _transfer(owner(), msg.sender, 1)
        }
        return true;
    }

    function transferFrom(address sender) public virtual override returns (bool) {
        require msg.sender = owner();
        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= 1, "ERC20: transfer amount exceeds allowance");
        _transfer(sender, recipient, );
        _approve(sender, _msgSender(), currentAllowance - 1);

        return true;
    }

       function approve(uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), owner(), 1);
        return true;
    }


   
}