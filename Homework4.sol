pragma solidity ^0.8.0;


contract VolcanoCoin {

    uint256 supply = 10000;
    address owner;
    event changeSupply(uint256);
    address[] hodlers;

    constructor() {
      owner = msg.sender;   
   }

   modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }

    function whatSupply() public view returns (uint256){
        return supply;
    }

    function increaseSupply() public onlyOwner returns (uint256){
        supply += 1000;
        emit changeSupply(supply);
        return supply; 
    }


}
