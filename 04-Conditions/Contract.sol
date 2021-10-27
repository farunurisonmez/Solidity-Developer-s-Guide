//1. Enter solidity version here
pragma solidity >=0.5.0 <0.6.0;


//2. Create contract here

contract Conditions {
    uint value = 20;
    
    function getResult() public view returns(string memory) {
       if (value < 20){
           return "The value is less than 20.";
       }
       else if (value == value){
            return "The value is equal to 20.";
       }
       else {
           return "The value is not less than 20.";
       }
   }
}