// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMintWithModifier is ERC721 {

    /**
     * @dev
     * - 
     */
    address public owner;

    constructor() ERC721("OnlyOwnerMintWithModifier", "OWNERMOD") {
        owner = _msgSender();
    }

    modifier onlyOwner {
        require(owner == _msgSender(), "Caller is not the owner.");
        _;
    }

    /**
     * @dev
     * - 
     * -
     */
    function nftMint(uint256 tokenId) public onlyOwner{
        _mint(_msgSender(), tokenId);
    }
}