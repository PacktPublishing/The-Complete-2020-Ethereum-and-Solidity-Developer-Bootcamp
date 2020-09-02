pragma solidity >=0.5.15 <0.7.0;

contract A {
    
    uint someUint;
    
    function fun() public virtual {
        someUint = 5;
    }
}