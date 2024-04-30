pragma solidity ^0.4.24;

contract DeprecatedSimple {
    // Do everything that's deprecated, then commit suicide.

    function useDeprecated() public constant {
        bytes32 block_hash = blockhash(0);
        bytes32 hashofhash = keccak256(block_hash);

        uint gas = gasleft();

        if (gas == 0) {
            revert();
        }

        require(address(this).delegatecall());

        var a = [1, 2, 3];

        var (x, y, z) = (false, "test", 0);

        suicide(address(0));
    }

    function() public {}
}
