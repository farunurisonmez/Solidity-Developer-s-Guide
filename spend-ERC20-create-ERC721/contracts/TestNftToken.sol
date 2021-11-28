pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/access/Ownable.sol";

import { ERC20Spendable } from "./TestToken.sol";

contract TestNftToken is ERC721, Ownable {
    
    constructor() ERC721("TEST NFT Token", "TESTNFT") {
    }
    
    uint256 _mintingPrice;
    
    ERC20Spendable _mintingCurrency;
    
    uint256 nextCertificateId = 1;
    
    mapping(uint256 => bytes32) certificateDataHashes;
    
    function hashForToken(uint256 tokenId) external view returns (bytes32) {
        return certificateDataHashes[tokenId];
    }
    
    function mintingPrice() external view returns (uint256) {
        return _mintingPrice;
    }
    
    function mintingCurrency() external view returns (ERC20Spendable) {
        return _mintingCurrency;
    }
    
    function setMintingPrice(uint256 newMintingPrice) onlyOwner external {
        _mintingPrice = newMintingPrice;
    }
    
    function setMintingCurrency(ERC20Spendable newMintingCurrency) onlyOwner external {
        _mintingCurrency = newMintingCurrency;
    }
    
    function create(bytes32 dataHash) external returns (uint) {
        _mintingCurrency.spend(msg.sender, 1);
        uint256 newCertificateId = nextCertificateId;
        _mint(msg.sender, newCertificateId);
        certificateDataHashes[newCertificateId] = dataHash;
        nextCertificateId = nextCertificateId + 1;
        return newCertificateId;
    }
}
