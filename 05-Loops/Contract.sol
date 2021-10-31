
pragma solidity >=0.5.0 <0.8.0;

contract Loop {
    
    uint[] data;
    uint8 i = 0; 
    
    function forLoop() public returns (uint[] memory) {

        for(i = 0; i < 10; i++) {
            i++;
            data.push(i);
        }
        
        return data;
    }
    
    function whileLoop() public returns (uint[] memory){
        while (i < 8){
            i++;
            data.push(i);
        }
        return data;
    }
    
    function doWhileLoop() public returns (uint[] memory){
        do {
            i+=2;
            data.push(i);
        }
        while(i < 3);
        
        return data;
    }
}