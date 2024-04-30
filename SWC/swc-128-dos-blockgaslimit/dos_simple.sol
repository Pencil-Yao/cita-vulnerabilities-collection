pragma solidity ^0.4.25;

contract DosOneFunc {
    address[] public listAddresses;

    function ifillArray() public returns (bool) {
        if (listAddresses.length < 1500) {
            for (uint i = 0; i < 350; i++) {
                //! gas dos
                listAddresses.push(msg.sender);
            }
            return true;
        } else {
            listAddresses = new address[](0);
            return false;
        }
    }
}
