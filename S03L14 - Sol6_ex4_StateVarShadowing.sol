pragma solidity >=0.5.15 <=0.6.0;

/**
 * https://solidity.readthedocs.io/en/v0.6.0/060-breaking-changes.html#explicitness-requirements
 * State variable shadowing is now disallowed. 
 * A derived contract can only declare a state variable x, 
 * if there is no visible state variable with the same name in any of its bases.
 */

/**
 * works in 0.5.14
 * *
contract A {
    uint x = 123;
}

contract B is A {
    uint x = 234;
}

/**/

/**
 * works in 0.6.0
 * */
 contract A {
    uint private x = 123;
}

contract B is A {
    uint x = 234;
}

/**/
 