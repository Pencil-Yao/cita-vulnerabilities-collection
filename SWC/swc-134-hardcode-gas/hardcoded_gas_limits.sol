/*
 * @author: Bernhard Mueller (ConsenSys / MythX)
 */

pragma solidity 0.6.4;

interface ICallable {
    function callMe() external;
}

contract HardcodedNotGood {
    address payable public _callable = 0xaAaAaAaaAaAaAaaAaAAAAAAAAaaaAaAaAaaAaaAa;
    ICallable public callable = ICallable(_callable);

    constructor() public payable {}

    function doTransfer(uint256 amount) public {
        _callable.transfer(amount);
    }

    function doSend(uint256 amount) public {
        require(_callable.send(amount));
    }

    function callLowLevel() public {
        (bool success, ) = _callable.call.value(0).gas(10000)(""); //! hardcode gas
        require(success);
    }

    function callLowLevelDelegate() public {
        (bool success, ) = _callable.delegatecall.gas(10000)("");
        require(success);
    }

    function callWithArgs() public {
        callable.callMe{ gas: 10000 }(); //! hardcode gas
    }
}
