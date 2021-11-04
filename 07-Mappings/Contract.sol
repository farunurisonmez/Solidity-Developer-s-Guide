pragma solidity ^0.8.0;

// Mapping
// - Create a mapipping
// - Get value
// - Set value
// - Delete value

// - - Like dictionary (Python), map (JavaScript)
// - - Cannot iterate
// - - Connot get size

contract Mapping {
    //mapping(_KeyType => _ValueType) public mappingName
    
    mapping(string => string) public myMap;
    
    function get(string memory key) public view returns (string memory){
        return myMap[key];
    }
    
    function set(string memory key, string memory value) public {
        myMap[key] = value;
    }
    
    function remove(string memory key) public {
        delete myMap[key];
    }
}