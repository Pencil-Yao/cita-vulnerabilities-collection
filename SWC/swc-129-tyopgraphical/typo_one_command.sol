pragma solidity ^0.4.25;

contract TypoOneCommand {
    uint public numberOne = 1;

    function alwaysOne() public {
        numberOne = +1; //! typo
    }
}
