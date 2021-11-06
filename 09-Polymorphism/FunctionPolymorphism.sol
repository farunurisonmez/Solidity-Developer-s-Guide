pragma solidity ^0.8.0;

contract Product {
    
    function get_id(uint16 id) public pure returns (uint){
        return id;
    }
    
    function get_id(uint id) public pure returns (uint){
        return id;
    }

}