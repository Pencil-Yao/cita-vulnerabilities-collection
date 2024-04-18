pragma solidity ^0.4.25;

contract TypoSimple {
    uint onlyOne = 1;
    bool win = false;

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
