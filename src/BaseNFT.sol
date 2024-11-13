pragma solidity ^0.8.18;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BaseNFT is ERC721 {
    uint256 private s_tokenCounter;

    mapping(uint256 => string) public s_tokenIdToUrl;

    constructor() ERC721("Doge", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenURL) public {
        s_tokenIdToUrl[s_tokenCounter] = tokenURL;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenid) public view override returns (string memory) {
        return s_tokenIdToUrl[tokenid];
    }
}
