// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {ERC20} from "./ERC20.sol";
import {SwapLib} from "./SwapLib.sol";

contract Router {
    function doTheSwap(address token, address from, uint256 amt) public {
        ERC20(token).transferFrom(from, address(this), amt);
    }
    function doTheSwapWithExternalLibrary(address token, address from, uint256 amt) public {
        SwapLib.receiveToken(token, from, amt);
    }
}
