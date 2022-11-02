// SPDX-License-Identifier: None
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
        address sender;
        uint256 payAmt;
        address hodler;
    }

    payment[] public transfers;
    mapping(address => payment[]) public pmtTracking;

    function whatSupply() public view returns (uint256){
        return supply;
    }

    function increaseSupply() public returns (uint256){
        require(msg.sender == owner(), "You aren't the owner");
        supply += 1000;
        emit changeSupply(supply);
        return supply; 
    }

    function transfer(uint256 _amt, address _rcpt) public {
        require(balances[msg.sender] >= _amt, "Get More Money");
        balances[msg.sender] -= _amt;
        balances[_rcpt] += _amt;
        transfers.push(payment({sender: msg.sender, payAmt: _amt, hodler: _rcpt}));
        pmtRecord(msg.sender, _amt, _rcpt);
        emit transferbb(msg.sender, _amt, _rcpt);
    }

     function getPayments(address user) public view returns (payment[] memory){
        return pmtTracking[user];
    }

    function pmtRecord(address _sender, uint256 _payAmt, address _hodler) internal {
        pmtTracking[_sender].push(payment(_sender, _payAmt, _hodler));
    }
}