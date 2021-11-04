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
    
    mapping(string => int) public myMap;
    
    function get(string memory user) public view returns (int){
        return myMap[user];
    }
    
    function set(string memory user, int level) public {
        myMap[user] = level;
    }
    
    function remove(string memory user) public {
        delete myMap[user];
    }
}