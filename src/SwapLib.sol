// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "./ERC20.sol";

library SwapLib {
    function receiveToken(address token, address sender, uint256 amount) external {
        ERC20(token).transferFrom(sender, address(this), amount);
    }
}