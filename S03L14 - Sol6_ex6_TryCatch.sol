pragma solidity ^0.6.0;

contract ContractA {
    function funARequireFailure() public pure {
        require(false, "This is an error String");
    }
    
    function funBRevertFailure() public pure {
        revert("Error from Contract A");
    }
    
    function funCAssertFailure() public pure {
        assert(false);
    }
}

contract B {
    ContractA instA;
    
    event Error(string _reason);
    event LowLevelError(bytes _reason);
    
    constructor() public {
        instA = new ContractA();
    }
    
    function testRequireTryCatch() public returns(bool) {
        try instA.funCAssertFailure() {
            return true;
        } catch Error(string memory reason) {
            // This is executed in case
            // revert was called inside getData
            // and a reason string was provided.
            emit Error(reason);
            return false;
        } catch (bytes memory lowLevelData) {
            // This is executed in case revert() was used
            // or there was a failing assertion, division
            // by zero, etc. inside getData.
            emit LowLevelError(lowLevelData);
            return false;
        }
    }
}