// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleNFT {

    mapping(uint256=>address) private owners;

    function ownerOf(uint256 _tokenId) external view returns (address){

        return owners[_tokenId];
    }

}
