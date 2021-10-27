//1. Enter solidity version here
pragma solidity >=0.5.0 <0.6.0;


//2. Create contract here

contract HelloWorld {
    uint storedData; // State variable
    
    constructor() public {
        storedData = 10;   
    }
    
    function getAddition() public view returns(uint){
      uint a = 1; // local variable
      uint b = 2;
      uint result = storedData + a + b;
      return result; //access the local variable
   }
   
   function getSubtraction() public view returns(uint){
      uint a = 1; // local variable
      uint b = 2;
      uint result = storedData - a - b;
      return result;
   }
   
   function getMultiplication() public view returns(uint){
       uint a = 1;
       uint b = 2;
       uint result = storedData * a * b;
       return result;
   }
   
   function getDivision() public view returns(uint){
       uint a = 1;
       uint b = 2;
       uint result = storedData / a / b;
       return result;
   }
   
   function getMod() public view returns(uint){
       uint a = 1;
       uint b = 2;
       uint result = a % b;
       return result;
   }
}