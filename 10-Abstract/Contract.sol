pragma solidity ^0.8.0;

contract GameCalculator {
    function GetValue() public virtual view returns (uint){}
    
    function AddNumber(uint _value) public virtual returns (uint){
        return 4;
    }
}

contract ManGameCalculator is GameCalculator {
    uint private point;
    
    function GetValue() public override view returns (uint) {
        return point;
    }
    
    function AddNumber(uint _point) public override returns (uint){
        point = _point;
    }
}
