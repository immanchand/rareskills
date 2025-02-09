// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleNFT {

    mapping(uint256=>address) private owners;
    uint256 constant MAX_SUPPLY = 100;
    string constant baseURI = "https://example.com/images/";
    
    function mint(uint256 _tokenId) external {

        require(owners[_tokenId] == address(0), "Token already minted");
        require(_tokenId < MAX_SUPPLY, "Token outside of MAX SUPPLY" );
        owners[_tokenId] = msg.sender;
    }

    function ownerOf(uint256 _tokenId) external view returns (address){
        require(owners[_tokenId]!=address(0), "Token does not exist");
        return owners[_tokenId];
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
        require(owners[_tokenId]!=address(0), "Token does not exist");
        require(_from==owners[_tokenId], "The from address is not the owner of this token");
        require(msg.sender==_from, "Only the owner can transfer their token");

        owners[_tokenId]=_to;
    }

    function tokenURI(uint256 _tokenId) external pure returns (string memory){
        require(_tokenId<MAX_SUPPLY, "Token outside of MAX SUPPLY");
        return string(abi.encodePacked(baseURI, _tokenId));
    }

}
