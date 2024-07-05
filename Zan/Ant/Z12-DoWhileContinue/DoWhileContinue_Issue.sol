pragma solidity ^0.4.19;

contract Test {
    function bad1() public {
        uint test = 0;
        do {
            //leak
            test++;
            if (test > 4) {
                continue;
            }
        } while (test < 8);
    }

    function bad2(int256 index) public {
        uint test = 0;
        if (index > 10) {
            do {
                //leak
                test++;
                if (test > 4) {
                    continue;
                }
            } while (test < 8);
        } else {
            do {
                test++;
            } while (test < 8);
        }
    }

    function good1() public {
        for (uint i = 0; i < 10; i++) {
            if (i > 5) continue;
        }

        uint test = 0;
        do {
            test++;
        } while (test < 8);
    }
}
