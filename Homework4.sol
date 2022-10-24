pragma solidity ^0.8.0;


contract VolcanoCoin {

    uint256 supply = 10000;
    address owner;
    event changeSupply(uint256 indexed);
    event transferbb(address, uint256, address);
    mapping(address=>uint256) public balances;
    

    constructor() {
      owner = msg.sender;
      balances[owner] += supply;  
   }

   modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }

    struct payment {
        uint256 payAmt;
        address hodler;
    }

    payment[] pmtTracking;

    function whatSupply() public view returns (uint256){
        return supply;
    }

    function increaseSupply() public onlyOwner returns (uint256){
        supply += 1000;
        emit changeSupply(supply);
        return supply; 
    }

    function transfer(uint _amt, address _rcpt) public payable{
        require(balances[msg.sender] <= _amt, "Get More Money");
        balances[msg.sender] -= _amt;
        balances[_rcpt] += _amt;
        pmtTracking.push(payment({payAmt: _amt, hodler: _rcpt}));
        emit transferbb(msg.sender, _amt, _rcpt);
    }

}
