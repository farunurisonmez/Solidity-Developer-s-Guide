pragma solidity ^0.8.0;

contract Product {
    uint internal _id;
    string _name;
    uint _price;
    
    function set_id(uint id) public {
        _id = id;
    }
    
    function get_id() public virtual view returns (uint){
        return _id;
    }
    
    function set_name(string memory name) public {
        _name = name;
    }
    
    function get_name() public virtual view returns (string memory) {
        return _name;
    }
    
    function set_price(uint price) public {
        _price = price;
    }
    
    function get_price() public virtual view returns (uint){
        return _price;
    }
    
}

contract ProductManager is Product {
    function get_id() public override view returns(uint){
        return _id;
    }
    
    function get_name() public override view returns (string memory){
        return _name;
    }
    
    function get_price() public override view returns (uint){
        return _price;
    }
}