
pragma solidity >=0.5.0 <0.8.0;
pragma abicoder v2;


contract Arrays {
/*
 * Syntax: <data type> <array name>[size] = <initialization>
 * string array supported for pragma abicoder v2;
 */
 
 
    string[3] students;
    uint[3] numbers;
    uint[6] myList;
    

    string[3][3] cities;
    
   constructor() public{
       students = ["Faru1", "Faru2", "Faru3"];
       numbers = [5,6,7];  
       myList = [1,2,3,4,5,6];
       
       cities[0][0] = "Istanbul";
       cities[0][1] = "Bursa";
       cities[0][2] = "Bilecik";
       cities[1][0] = "Kayseri";
       cities[1][1] = "Yozgat";
       cities[1][2] = "Ankara";
       cities[2][0] = "Siirt";
       cities[2][1] = "Diyarbakir";
       cities[2][2] = "Agri";
   }

    
    function stringArray() public view returns (string[3] memory){
        return students;
    }
    
    function intArray() public view returns (uint[3] memory){
        return numbers;
    }
    
    function examples() public view returns (uint){
        uint total = 0;
        uint max = myList[0];
        
        for(uint number=0; number <= myList.length; number++){
            if(max < number){
                max = number;
            }
            total = total + number;
        }
        
        return total;
    }
    
    function multiDimensionalArray() public view returns(string[3][3] memory){
         return cities;
    }
}