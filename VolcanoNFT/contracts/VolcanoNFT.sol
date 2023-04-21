// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract VolcanoNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
    string public baseTokenURI;

    constructor() ERC721("VolcanoNFT", "MGMA") {
        baseTokenURI="";
    }
    
    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        return newItemId;
    }
     /// @dev Returns an URI for a given token ID
    function _baseURI() internal view virtual override returns (string memory) {
    return baseTokenURI;
    }

  /// @dev Sets the base token URI prefix.
    function setBaseTokenURI(string memory _baseTokenURI) public {
    baseTokenURI = _baseTokenURI;
    }
}