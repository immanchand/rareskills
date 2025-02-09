// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleNFT {

    mapping(uint256=>address) private owners;
    
    function mint(uint256 _tokenId) external {

        owners[_tokenId] = msg.sender;
    }

    function ownerOf(uint256 _tokenId) external view returns (address){
        require(owners[_tokenId]!=address(0), "Token does not exist");
        return owners[_tokenId];
    }

}
