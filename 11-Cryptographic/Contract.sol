pragma solidity ^0.8.0;

contract GameCalculator {
    function callKeccak256() public pure returns(bytes32 result){
        return keccak256("Test");
    }

    function callSHA256() public pure returns(bytes32 result){
        return sha256("Test");
    }
    
    function callRipemd160() public pure returns(bytes20 result){
        return ripemd160("Test");
    }
}
