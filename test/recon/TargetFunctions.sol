// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract TargetFunctions is
    BaseTargetFunctions,
    Properties
{
    // == doTheSwap | Prank == //

    function test_theTransfer_p_b_b() public {
        vm.prank(borrower);
        try router.doTheSwap(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }

    function test_theTransfer_p_b_l() public {
        vm.prank(borrower);
        try router.doTheSwap(address(token), lender, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }

    function test_theTransfer_p_l_l() public {
        vm.prank(lender);
        try router.doTheSwap(address(token), lender, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }
    function test_theTransfer_p_l_b() public {
        vm.prank(lender);
        try router.doTheSwap(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }

    // == doTheSwap | Start Prank == //

    function test_theTransfer_b_b() public {
        vm.startPrank(borrower);
        try router.doTheSwap(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }
    function test_theTransfer_b_l() public {
        vm.startPrank(borrower);
        try router.doTheSwap(address(token), lender, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }

    function test_theTransfer_l_l() public {
        vm.startPrank(lender);
        try router.doTheSwap(address(token), lender, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }
    function test_theTransfer_l_b() public {
        vm.startPrank(lender);
        try router.doTheSwap(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }

    // == doTheSwapWithExternalLibrary | Start Prank == //

    function test_theTransferLibStartP_L_B() public {
        vm.startPrank(lender);
        try router.doTheSwapWithExternalLibrary(address(token), borrower, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
        vm.stopPrank();
    }

    function test_theTransferLibStartP_L_L() public {
        vm.startPrank(lender);
        try router.doTheSwapWithExternalLibrary(address(token), lender, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
        vm.stopPrank();
    }

    function test_theTransferLibStartP_B_L() public {
        vm.startPrank(borrower);
        try router.doTheSwapWithExternalLibrary(address(token), lender, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
        vm.stopPrank();
    }

    function test_theTransferLibStartP_B_B() public {
        vm.startPrank(borrower);
        try router.doTheSwapWithExternalLibrary(address(token), borrower, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
        vm.stopPrank();
    }

    // == doTheSwapWithExternalLibrary | Prank == //
    function test_theTransferLib_P_B_B() public {
        vm.prank(borrower);
        try router.doTheSwapWithExternalLibrary(address(token), borrower, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
    }
    function test_theTransferLib_P_B_L() public {
        vm.prank(borrower);
        try router.doTheSwapWithExternalLibrary(address(token), lender, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
    }
    function test_theTransferLib_P_L_L() public {
        vm.prank(lender);
        try router.doTheSwapWithExternalLibrary(address(token), lender, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
    }
    function test_theTransferLib_P_L_B() public {
        vm.prank(lender);
        try router.doTheSwapWithExternalLibrary(address(token), borrower, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
    }
}
