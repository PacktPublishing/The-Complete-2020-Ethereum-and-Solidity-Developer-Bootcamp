pragma solidity ^0.6.0;

/**
 * New Fallback Function and Receive function
 * for 0.6.0 only
 * */
contract A {
    event SomeEvent(address _addr, uint _amount);
    
    /**
     * Will be called when (fallback) is used in Remix
     */
    receive() external payable {
        emit SomeEvent(msg.sender, msg.value);
    }
    
    /**
     * Will be called when msg.data is not empty or when receive() doesn't exist
     * 
     * If not payable => assert-style error on msg.value not empty
     * */
    fallback () external {
        
    }
}