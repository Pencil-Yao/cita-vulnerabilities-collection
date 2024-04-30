/*
 * @source: http://blockchain.unica.it/projects/ethereum-survey/attacks.html#simpledao
 * @author: Atzei N., Bartoletti M., Cimoli T
 * Modified by Josselin Feist
 */
pragma solidity 0.4.24;

contract SimpleDAO {
    mapping(address => uint) public credit;

    function donate(address to) public payable {
        credit[to] = 0;
    }

    function withdraw(uint amount) public {
        if (credit[msg.sender] >= amount) {
            require(msg.sender.call.value(amount)());
            credit[msg.sender] -= amount; //! reentry set credit before transfer value
        }
    }

    function queryCredit(address to) public view returns (uint) {
        return credit[to];
    }
}
