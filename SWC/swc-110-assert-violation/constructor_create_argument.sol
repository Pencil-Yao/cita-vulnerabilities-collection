/*
 * @source: ChainSecurity
 * @author: Anton Permenev
 */
pragma solidity ^0.4.22;

contract ConstructorCreateArgument {
    B public b = new B(11);

    function check() {
        assert(b.foo() == 10);
    }
}

contract B {
    uint public x_;
    constructor(uint x) {
        x_ = x;
    }

    function foo() returns (uint) {
        return x_;
    }
}
