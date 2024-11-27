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
    // Check that it works as you would expect
    function test_theTransfer() public {
        vm.prank(borrower);
        try router.doTheSwap(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }

    function test_theTransfer_startP() public {
        vm.startPrank(lender);
        try router.doTheSwap(address(token), lender, 1e18) {

        } catch {
            t(false, "Should work");
        }

        vm.stopPrank();
        vm.startPrank(borrower);
        try router.doTheSwap(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
        vm.stopPrank();
    }

    function test_theTransferLib() public {
        vm.prank(borrower);
        try router.doTheSwapWithExternalLibrary(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
    }
    function test_theTransferLibStartP() public {
        vm.startPrank(lender);
        try router.doTheSwapWithExternalLibrary(address(token), borrower, 1e18) {
            
        } catch {
            t(false, "Should work");
        }
        vm.stopPrank();
        
        vm.startPrank(borrower);
        try router.doTheSwapWithExternalLibrary(address(token), borrower, 1e18) {

        } catch {
            t(false, "Should work");
        }
        vm.stopPrank();
    }
}
