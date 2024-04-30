pragma solidity ^0.4.22;

contract TwoMappings {
    mapping(uint => uint) public m;
    mapping(uint => uint) public n;

    constructor() {
        m[10] = 100;
    }

    function check(uint a) {
        assert(n[a] == 0);
    }
}
