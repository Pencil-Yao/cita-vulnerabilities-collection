/*
 * @source: https://github.com/sigp/solidity-security-blog#visibility
 * @author: SigmaPrime
 * Modified by Gerhard Wagner
 */

pragma solidity ^0.4.24;

contract HashForEther {
    mapping(address => uint256) public balances;
    function withdrawWinnings() {
        // Winner if the last 8 hex characters of the address are 0.
        require(uint32(msg.sender) == 0);
        balances[msg.sender] = 100;
        sendWinnings();
    }

    function sendWinnings() {
        bool success = msg.sender.call.value(balances[msg.sender])("");
        require(success, "transfer failed");
    }
}
