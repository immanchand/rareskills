// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//import "@openzeppelin/contracts/access/Ownable.sol";

contract ICNFT is ERC721("IC ART COLLECTION","ICNFT"){

    uint256 public constant MAX_SUPPLY = 5;
    uint256 public constant ART_PRICE = 1000000 gwei;
    address immutable artist;

    constructor() {
        artist = msg.sender;
    }

    function mint(uint256 _tokenId) external payable{
        require(_tokenId < MAX_SUPPLY, "Token out of max supply");
        require(msg.value==ART_PRICE, "Please pay the exact price");
        _safeMint(msg.sender, _tokenId);
    }

    function withdraw() external {
       // msg.sender.call{value: address(this).balance}("");
       require(msg.sender==artist,"Only the artist can withdraw");
       payable(msg.sender).transfer(address(this).balance);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmbN4pdHZDrvWomn7FH7RqgWX5RRGjADUBVG9zK3nsA1su/";
    }

}
