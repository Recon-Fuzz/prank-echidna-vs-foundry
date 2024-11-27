// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseSetup} from "@chimera/BaseSetup.sol";
import {vm} from "@chimera/Hevm.sol";

import "src/ERC20.sol";
import "src/Router.sol";

abstract contract Setup is BaseSetup {
    ERC20 token;
    Router router;


    address lender = address(20);
    address borrower = address(30);

    function setup() internal virtual override {
        token = new ERC20("TOK", "token");
        router = new Router();

        token.mint(lender, type(uint88).max);
        token.mint(borrower, type(uint88).max);

        vm.startPrank(lender);
        token.approve(address(router), type(uint256).max);
        vm.stopPrank();
        vm.startPrank(borrower);
        token.approve(address(router), type(uint256).max);
        vm.stopPrank();
    }
}
