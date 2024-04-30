/*
 * @source: ChainSecurity
 * @author: Anton Permenev
 */
pragma solidity ^0.4.22;

contract MappingPerformance2sets {
    mapping(bytes32 => uint) public m0;
    mapping(bytes32 => uint) public m1;
    mapping(bytes32 => uint) public m2;
    mapping(bytes32 => uint) public m3;
    mapping(bytes32 => uint) public m4;
    mapping(bytes32 => uint) public m5;
    uint public b;

    constructor() {
        b = 10;
    }

    function set(bytes32 a, uint cond) {
        if (cond == 0) {
            m0[a] = 5;
        } else if (cond == 1) {
            m1[a] = 5;
        } else if (cond == 2) {
            m2[a] = 5;
        } else if (cond == 3) {
            m3[a] = 5;
        } else if (cond == 4) {
            m4[a] = 5;
        }
    }
    function check(bytes32 a0, uint cond0, bytes32 a1, uint cond1, bytes32 a) {
        set(a0, cond0);
        set(a1, cond1);
        assert(m5[a] == 0);
    }
}
