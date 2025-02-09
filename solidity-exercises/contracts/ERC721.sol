// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleNFT {

    mapping(uint256=>address) private owners;
    uint256 constant MAX_SUPPLY = 100;
    
    function mint(uint256 _tokenId) external {

        require(owners[_tokenId] == address(0), "Token already minted");
        require(_tokenId < MAX_SUPPLY, "Token outside of MAX SUPPLY" );
        owners[_tokenId] = msg.sender;
    }

    function ownerOf(uint256 _tokenId) external view returns (address){
        require(owners[_tokenId]!=address(0), "Token does not exist");
        return owners[_tokenId];
    }

}
