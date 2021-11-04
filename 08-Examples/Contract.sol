pragma solidity ^0.8.0;

contract Examples {
    
    struct UserInfo{
        string displayName;
        int armor;
        string rank;
        bool status;
    }
    
    mapping(uint256 => UserInfo) listings;
    
    function get(uint256 user) public view returns(UserInfo memory){
        return listings[user];
    }
    
    function set(uint256 user, UserInfo memory info) public {
        listings[user] = info;
    }
    
}