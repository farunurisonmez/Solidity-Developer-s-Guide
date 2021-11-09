pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.1.0/contracts/access/AccessControl.sol";

/**
 * This is an access control role for entities that may spend tokens
 **/
contract SpenderRole is ERC20, AccessControl {
    
    event SpenderAdded(address indexed account);
    event SpenderRemoved(address indexed account);
  
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
     
    constructor() ERC20("TEST Token", "TEST") {
        _addSpender(msg.sender);
    }
    
    modifier onlySpender(){
        require(isSpender(msg.sender));
        _;
    }
    
    function isSpender(address account) public view returns (bool){
        return hasRole(BURNER_ROLE, msg.sender);
    }
    
    function addSpender(address account) public onlySpender {
        _addSpender(account);
    }
    
    function _addSpender(address account) internal {
        grantRole(BURNER_ROLE,account);
        emit SpenderAdded(account);
    }
    
    function renounceSpender() public {
        _removeSpender(msg.sender);
    }
    
    function _removeSpender(address account) internal {
        revokeRole(BURNER_ROLE,account);
        emit SpenderRemoved(account);
    }
}

/** 
 * @dev ERC20 spender logic
 **/
 
 contract ERC20Spendable is SpenderRole {
    
    /**
    * @dev Function to mint tokens
    * @param from The address that will spend the tokens
    * @param value The amount of tokens to spend
    * @return A boolean that indicates if the operation was successful
    **/
   
    function spend(address from, uint256 value) public onlySpender returns(bool) {
        _burn(from, value);
        return true;
    }
}

contract TestToken is SpenderRole {
    function mint(address to, uint256 value) public returns(bool){
        _mint(to, value);
        return true;
    }
}
