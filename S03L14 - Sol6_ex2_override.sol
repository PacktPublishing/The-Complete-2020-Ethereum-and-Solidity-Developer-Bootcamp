pragma solidity >=0.5.15 <=0.6.0;

/**
 * https://solidity.readthedocs.io/en/v0.6.0/060-breaking-changes.html#explicitness-requirements
 * Functions can now only be overridden when they are either marked with the virtual keyword or 
 * defined in an interface. Functions without implementation outside an interface have to be marked virtual. 
 * When overriding a function or modifier, the new keyword override must be used. When overriding a function 
 * or modifier defined in multiple parallel bases, all bases must be listed in parentheses after the keyword 
 * like so: override(Base1, Base2).
 * 
 * */


/** 
 * Works in Solidity 0.5.15
 * 
 * *

contract A {
    event MyEvent(string _myString);
    function funA() public {
        emit MyEvent("from A");
    }
}

contract B {
    function funA() public {
        //does nothing
    }
}

contract C is B,A {
    function funA() public {
        emit MyEvent("from B");
        super.funA();
    }
}
/**/



/**
 * works in 0.6.0
* */

contract A {
    event MyEvent(string _myString);
    function funA() public virtual {
        emit MyEvent("from A");
    }
}

contract B {
    function funA() public virtual {
        //does nothing
    }
}

contract C is A,B {
    function funA() public override(B,A) {
        emit MyEvent("from B");
        super.funA();
    }
}
/**
 * */