pragma solidity >=0.5.15 <=0.6.0;

/**
 * https://solidity.readthedocs.io/en/v0.6.0/060-breaking-changes.html#explicitness-requirements
 * Member-access to length of arrays is now always read-only, even for storage arrays. It is no 
 * longer possible to resize storage arrays assigning a new value to their length. 
 * Use push(), push(value) or pop() instead, or assign a full array, which will of 
 * course overwrite existing content. The reason behind this is to prevent storage 
 * collisions by gigantic storage arrays.
 * 
 * */

/**
 * works in 0.5.15
 * *
contract MyContract {
    uint[] public myUintArray;
    
    function add(uint _num) public {
        myUintArray.length++;
        myUintArray[myUintArray.length - 1] = _num;
    }
    
    function removeElement() public {
        myUintArray.length--;
    }
}
/* */

/**
 * works in 0.5.15 AND 0.6.0
 * */
contract MyContract {
    uint[] public myUintArray;
    
    function add(uint _num) public {
        myUintArray.push(_num);
    }
    
    function removeElement() public {
        myUintArray.pop();
    }
}

/* */