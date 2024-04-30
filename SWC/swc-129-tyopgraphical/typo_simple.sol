pragma solidity ^0.4.25;

contract TypoSimple {
    uint public onlyOne = 1;
    bool public win = false;

    function addOne() public {
        onlyOne = +1; //! typo
        if (onlyOne > 1) {
            win = true;
        }
    }

    function iWin() public view returns (bool) {
        return win;
    }
}
