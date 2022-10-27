/*Add OpenZeppelin Ownable to the VolcanoCoin contract*/

import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.0;

contract VolcanoCoin is Ownable {

    uint256 supply = 10000;
    event changeSupply(uint256 indexed);
    event transferbb(address, uint256, address);
    mapping(address=>uint256) public balances;
    

    constructor() {
      balances[owner()] = supply;  
   }

    struct payment {
        uint256 payAmt;
        address hodler;
    }

    payment[] transfers;
    mapping(address => payment[]) public pmtTracking;

    function whatSupply() public view returns (uint256){
        return supply;
    }

    function increaseSupply() public onlyOwner returns (uint256){
        supply += 1000;
        emit changeSupply(supply);
        return supply; 
    }

    function transfer(uint256 _amt, address _rcpt) public {
        require(balances[msg.sender] >= _amt, "Get More Money");
        balances[msg.sender] -= _amt;
        balances[_rcpt] += _amt;
        transfers.push(payment({payAmt: _amt, hodler: _rcpt}));
        pmtTracking[msg.sender]=transfers; 
        emit transferbb(msg.sender, _amt, _rcpt);
    }

    
     function getPayments(address user) public view returns (payment[] memory){
        return pmtTracking[user];
    }

}
