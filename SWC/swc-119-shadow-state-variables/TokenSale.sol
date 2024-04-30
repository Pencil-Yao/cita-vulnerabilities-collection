pragma solidity 0.4.24;

contract Tokensale {
    uint public hardcap = 10000 ether;

    function Tokensale() {}

    function fetchCap() public constant returns (uint) {
        return hardcap;
    }
}

contract Presale is Tokensale {
    uint public hardcap = 1000 ether;

    function Presale() Tokensale() {} //! shadow, eliminating declaration: hardcap = 1000 ether
}
