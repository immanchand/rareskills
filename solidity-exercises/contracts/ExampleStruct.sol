// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract StructsExample {

    struct Foo {
        uint256 a;
        uint256 b;
    }

    Foo[] public arrayFoo;

    function addFooToArray(uint256 _a, uint256 _b) public {
            arrayFoo.push(Foo(_a, _b));
    }

    function readFooFromArray(uint256 _index) public view returns(Foo memory){
            return arrayFoo[_index];
    }

    function readFooA(uint256 _index) public view returns(uint256){
            return arrayFoo[_index].a;
    }

    function modifyFooA(uint256 _index, uint256 _a) public {
            arrayFoo[_index].a = _a;
    }

    function setFooAtIndex(uint256 _index, uint256 _a, uint256 _b) public {
            arrayFoo[_index] = Foo(_a, _b);
    }
}
