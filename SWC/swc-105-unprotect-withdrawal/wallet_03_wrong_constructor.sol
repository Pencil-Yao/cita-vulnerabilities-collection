pragma solidity ^0.4.24;

/* User can add pay in and withdraw Ether.
   The constructor is wrongly named, so anyone can become 'creator' and withdraw all funds.
*/

contract Wallet {
    address public creator;

    mapping(address => uint256) public balances;

    function initWallet() public {
        creator = msg.sender; //! not construct function, wrong name
    }

    function deposit() public payable {
        assert(balances[msg.sender] + msg.value > balances[msg.sender]);
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender]);
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }

    // In an emergency the owner can migrate  allfunds to a different address.

    function migrateTo(address to) public {
        require(creator == msg.sender);
        to.transfer(this.balance);
    }
}
