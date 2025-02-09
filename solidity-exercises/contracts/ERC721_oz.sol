// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ICNFT is Ownable(msg.sender), ERC721("IC ART COLLECTION","ICNFT"){

    uint256 public constant MAX_SUPPLY = 100;
    uint256 public constant ART_PRICE = 10000000 gwei;

    function mint(uint256 _tokenId) external payable{
        require(_tokenId < MAX_SUPPLY, "Token out of max supply");
        require(msg.value==ART_PRICE, "Please pay the exact price");
        _safeMint(msg.sender, _tokenId);
    }

    function withdraw() external onlyOwner {
       // msg.sender.call{value: address(this).balance}("");
       payable(msg.sender).transfer(address(this).balance);
    }

}
