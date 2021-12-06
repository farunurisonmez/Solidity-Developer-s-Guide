pragma solidity ^0.8.0;

import "../contracts/TestNftToken.sol";

contract Reserve is IERC721Receiver {

    struct Commit {
        uint64 block;
        uint64 amount;
    }
    mapping (address => Commit) public commits;

    struct Listing {
        bool open;
        bool sold;
        address payable seller;
        uint256 price;
        uint256 tokenId;
    }

    TestNftToken nftContract;
    address payable owner;

    mapping(uint256 => Listing) listings;

    mapping(uint256 => Listing[]) tokenIdToListing;

    uint256 numListings;
    uint256 public revealNonce;

    constructor (address tokenAddress) {
        numListings = 0;
        nftContract = TestNftToken(tokenAddress);
        owner = payable(msg.sender);
    }

    function getNftContract() public view returns (address) {
        return address(nftContract);
    }

     function getOwner() public view returns (address) {
        return owner;
    }

    function setOwner(address payable newOwner) public {
        require(msg.sender == owner);
        owner = newOwner;
    }

    function onERC721Received(address operator, address from, uint256 tokenId, bytes memory data) override public returns (bytes4) {
        return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }

    function createNewListing(uint256 tokenId, uint256 price) public {
        require(address(this) == nftContract.ownerOf(tokenId), "Please transfer the NFT to this contract.");
        require(msg.sender == owner, "Only owner can create listings");
        Listing memory newlisting = Listing(true, false, payable(msg.sender), price, tokenId);
        listings[numListings] = newlisting;
        tokenIdToListing[tokenId].push(newlisting);
        numListings += 1;
    }

    function buy(uint256 tokenId) public payable {
        Listing storage listing = tokenIdToListing[tokenId][getListingHistorySize(tokenId) - 1];
        require(msg.sender != listing.seller, "You cannot buy your own item.");
        require(listing.open, "This listing has been closed.");
        require(msg.value >= listing.price, "Not enough paid");
        listing.seller.transfer(msg.value);
        nftContract.safeTransferFrom(address(this), msg.sender, tokenId);
        listing.open = false;
        listing.sold = true;
    }

    function randomBuy() public payable {
        uint256[] memory _tokenIDs = randomId();

        for (uint256 i = 0; i < _tokenIDs.length; i++) { 
            Listing storage listing = tokenIdToListing[listings[_tokenIDs[i]].tokenId][getListingHistorySize(listings[_tokenIDs[i]].tokenId) - 1];
            require(msg.sender != listing.seller, "You cannot buy your own item.");
            require(listing.open, "This listing has been closed.");
            require(msg.value >= listing.price, "Not enough paid");
            listing.seller.transfer(msg.value);
            nftContract.safeTransferFrom(address(this), msg.sender, listings[_tokenIDs[i]].tokenId);
            listing.open = false;
            listing.sold = true;
            if (listing.sold == true)
                break;
        }
    }

    function randomId() internal returns (uint256[] memory) {
        uint256[] memory randomIDs = new uint256[](3); 
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(revealNonce,block.difficulty,  
        msg.sender))) % 3;
        for (uint256 i = 0; i < 3; i++) {
            randomIDs[i] = randomIndex;
            randomIndex = (randomIndex + 1) % 3;
        }
        revealNonce++;
        return randomIDs;
     }

    function transferNft(uint256 tokenId, address to) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        nftContract.safeTransferFrom(address(this), to, tokenId);
    }

    function transferFunds(uint256 amount, address payable to) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        to.transfer(amount);
    }

    function getNumListings() public view returns (uint256) {
        return numListings;
    }

    function getListingById(uint256 listingID) public view returns (Listing memory) {
        return listings[listingID];
    }

    function isListingOpen(uint256 listingID) public view returns (bool) {
        return listings[listingID].open;
    }

    function closeListing(uint256 listingID) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        require(listings[listingID].sold == false, "This action cannot be performed on a sold listing.");
        listings[listingID].open = false;
    }

    function openListing(uint256 listingID) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        require(listings[listingID].sold == false, "This action cannot be performed on a sold listing.");
        listings[listingID].open = true;
    }

    function isListingSold(uint256 listingID) public view returns (bool) {
        return listings[listingID].sold;
    }

    function getListingSeller(uint256 listingID) public view returns (address) {
        return listings[listingID].seller;
    }

    function getListingPrice(uint256 listingID) public view returns (uint256) {
        return listings[listingID].price;
    }

    function setListingPrice(uint256 listingID, uint newPrice) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        require(listings[listingID].sold == false, "This action cannot be performed on a sold listing.");
        listings[listingID].price = newPrice;
    }

    function isListingOpenByTokenId(uint256 tokenId) public view returns (bool) {
        Listing memory listing = getLastListingByTokenId(tokenId);
        return listing.open;
    }

    function closeListingByTokenId(uint256 tokenId) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        Listing storage listing = tokenIdToListing[tokenId][getListingHistorySize(tokenId) - 1];
        require(listing.sold == false, "This action cannot be performed on a sold listing.");
        listing.open = false;
    }

    function openListingByTokenId(uint256 tokenId) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        Listing storage listing = tokenIdToListing[tokenId][getListingHistorySize(tokenId) - 1];
        require(listing.sold == false, "This action cannot be performed on a sold listing.");
        listing.open = true;
    }

    function isListingSoldByTokenId(uint256 tokenId) public view returns (bool) {
        Listing memory listing = getLastListingByTokenId(tokenId);
        return listing.sold;
    }

    function getListingSellerByTokenId(uint256 tokenId) public view returns (address) {
        Listing memory listing = getLastListingByTokenId(tokenId);
        return listing.seller;
    }

    function getListingPriceByTokenId(uint256 tokenId) public view returns (uint256) {
        Listing memory listing = getLastListingByTokenId(tokenId);
        return listing.price;
    }

    function setListingPriceByTokenId(uint256 tokenId, uint newPrice) public {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        Listing storage listing = tokenIdToListing[tokenId][getListingHistorySize(tokenId) - 1];
        require(listing.sold == false, "This action cannot be performed on a sold listing.");
        listing.price = newPrice;
    }

    function getListingTokenId(uint256 listingID) public view returns (uint256) {
        return listings[listingID].tokenId;
    }

    function getListingHistoryByTokenId(uint256 tokenId, uint256 index) public view returns (Listing memory) {
        return tokenIdToListing[tokenId][index];
    }

    function getListingHistorySize(uint256 tokenId) public view returns (uint256) {
        return tokenIdToListing[tokenId].length;
    }

    function getLastListingByTokenId(uint256 tokenId) public view returns (Listing memory) {
        return getListingHistoryByTokenId(tokenId, getListingHistorySize(tokenId) - 1);
    }
}