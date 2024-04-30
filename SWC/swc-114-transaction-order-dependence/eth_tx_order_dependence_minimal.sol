/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 */

pragma solidity ^0.4.16;

contract EthTxOrderDependenceMinimal {
    address public owner;
    bool public claimed;
    uint public reward;

    function EthTxOrderDependenceMinimal() public {
        owner = msg.sender;
    }

    function setReward() public payable {
        require(!claimed);

        require(msg.sender == owner);
        reward = msg.value;
        owner.transfer(reward);
    }

    function claimReward(uint256 submission) {
        //! submission should add salt
        require(!claimed);
        require(submission < 10);

        claimed = true;
        msg.sender.transfer(reward);
    }
}
