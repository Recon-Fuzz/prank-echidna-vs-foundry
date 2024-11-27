// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {TargetFunctions} from "./TargetFunctions.sol";
import {FoundryAsserts} from "@chimera/FoundryAsserts.sol";
import "forge-std/console2.sol";

contract CryticToFoundry is Test, TargetFunctions, FoundryAsserts {
    function setUp() public {
        setup();

    }

    // forge test --match-test test_crytic -vv
    function test_crytic() public {
        test_theTransfer();
        test_theTransfer_startP();
        test_theTransferLib();
        test_theTransferLibStartP();
    }
}
