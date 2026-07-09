// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract MyNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    constructor(
        address initialOwner
    ) ERC721("MyNFT", "MNFT") Ownable(initialOwner) {}

    function mint(address to) public onlyOwner {
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }
}
