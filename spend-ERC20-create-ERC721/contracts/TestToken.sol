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
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _addSpender(msg.sender);
    }
    
    function _addSpender(address account) internal {
        grantRole(BURNER_ROLE,account);
        emit SpenderAdded(account);
    }
    
}

/** 
 * @dev ERC20 spender logic
 **/
 
 contract ERC20Spendable is SpenderRole {

}

contract TestToken is SpenderRole {
    function mint(address to, uint256 value) public returns(bool){
        _mint(to, value);
        return true;
    }
}
