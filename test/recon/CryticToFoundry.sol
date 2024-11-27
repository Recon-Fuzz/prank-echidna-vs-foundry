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
        test_theTransfer_p_b_b();
        test_theTransfer_p_b_l();
        test_theTransfer_p_l_l();
        test_theTransfer_p_l_b();

        test_theTransfer_b_b();
        test_theTransfer_b_l();
        test_theTransfer_l_l();
        test_theTransfer_l_b();


        test_theTransferLibStartP_L_B();
        test_theTransferLibStartP_L_L();
        test_theTransferLibStartP_B_L();
        test_theTransferLibStartP_B_B();

        test_theTransferLib_P_B_B();
        test_theTransferLib_P_B_L();
        test_theTransferLib_P_L_L();
        test_theTransferLib_P_L_B();
    }

}
