# StartPrank Echidna vs Foundry Bug

Echidna Run:
https://getrecon.xyz/shares/0c8e4898-85bb-43da-be2c-1f97ec1dcf1f


## Foundry

Run all handlers with foundry with:

`
forge test --match-test test_crytic -vv
`

## Echidna

Run `echidna` with:

`
echidna . --contract CryticTester --config echidna.yaml
`

### Echidna Output

```solidity
WARNING: Running slither failed. Echidna will continue, however fuzzing will likely be less effective.

Loaded 10 transaction sequences from echidna/reproducers
Loaded 16 transaction sequences from echidna/coverage
test_theTransfer_l_l(): passing
test_theTransferLibStartP_B_B(): passing
test_theTransfer_p_b_b(): passing
test_theTransferLibStartP_B_L(): failed!💥  
  Call sequence:
    CryticTester.test_theTransferLibStartP_B_L()

Traces: 
call HEVM::startPrank(0x0000000000000000000000000000000123123123) (/code/test/recon/TargetFunctions.sol:113)
 └╴← 0x
call Router::doTheSwapWithExternalLibrary(address,address,uint256)(ERC20, 0x0000000000000000000000000000000000012123, 1000000000000000000) (/code/test/recon/TargetFunctions.sol:73)
 ├╴delegatecall 0x0000000000000000000000000000000000000F01::0x4ec109f4000000000000000000000000b4c79dab8f259c7aee6e5b2aa729821864227e8400000000000000000000000000000000000000000000000000000000000121230000000000000000000000000000000000000000000000000de0b6b3a7640000 (/code/src/Router.sol:11)
 │  ├╴call ERC20::transferFrom(address,address,uint256)(0x0000000000000000000000000000000000012123, Router, 1000000000000000000) <no source map>
 │  │  └╴error Revert («cent/insufficient-allowance») (/code/src/ERC20.sol:65)
 │  └╴error Revert («cent/insufficient-allowance») <no source map>
 └╴error Revert («cent/insufficient-allowance») (/code/src/Router.sol:11)
emit Log(«Should work») (/code/lib/chimera/src/CryticAsserts.sol:46)

test_theTransferLib_P_B_L(): passing
test_theTransfer_b_l(): failed!💥  
  Call sequence:
    CryticTester.test_theTransfer_b_l()

Traces: 
call HEVM::startPrank(0x0000000000000000000000000000000123123123) (/code/test/recon/TargetFunctions.sol:72)
 └╴← 0x
call Router::doTheSwap(address,address,uint256)(ERC20, 0x0000000000000000000000000000000000012123, 1000000000000000000) (/code/test/recon/TargetFunctions.sol:73)
 ├╴call ERC20::transferFrom(address,address,uint256)(0x0000000000000000000000000000000000012123, Router, 1000000000000000000) (/code/src/Router.sol:8)
 │  └╴error Revert («cent/insufficient-allowance») (/code/src/ERC20.sol:65)
 └╴error Revert («cent/insufficient-allowance») (/code/src/Router.sol:8)
emit Log(«Should work») (/code/lib/chimera/src/CryticAsserts.sol:46)

test_theTransfer_p_b_l(): passing
test_theTransferLib_P_L_L(): passing
test_theTransferLib_P_B_B(): passing
test_theTransferLib_P_L_B(): passing
test_theTransfer_p_l_l(): passing
test_theTransferLibStartP_L_B(): failed!💥  
  Call sequence:
    CryticTester.test_theTransferLibStartP_L_B()

Traces: 
call HEVM::startPrank(0x0000000000000000000000000000000000012123) (/code/test/recon/TargetFunctions.sol:123)
 └╴← 0x
call Router::doTheSwapWithExternalLibrary(address,address,uint256)(ERC20, 0x0000000000000000000000000000000123123123, 1000000000000000000) (/code/test/recon/TargetFunctions.sol:73)
 ├╴delegatecall 0x0000000000000000000000000000000000000F01::0x4ec109f4000000000000000000000000b4c79dab8f259c7aee6e5b2aa729821864227e8400000000000000000000000000000000000000000000000000000001231231230000000000000000000000000000000000000000000000000de0b6b3a7640000 (/code/src/Router.sol:11)
 │  ├╴call ERC20::transferFrom(address,address,uint256)(0x0000000000000000000000000000000123123123, Router, 1000000000000000000) <no source map>
 │  │  └╴error Revert («cent/insufficient-allowance») (/code/src/ERC20.sol:65)
 │  └╴error Revert («cent/insufficient-allowance») <no source map>
 └╴error Revert («cent/insufficient-allowance») (/code/src/Router.sol:11)
emit Log(«Should work») (/code/lib/chimera/src/CryticAsserts.sol:46)

test_theTransfer_p_l_b(): passing
test_theTransfer_l_b(): failed!💥  
  Call sequence:
    CryticTester.test_theTransfer_l_b()

Traces: 
call HEVM::startPrank(0x0000000000000000000000000000000000012123) (/code/test/recon/TargetFunctions.sol:81)
 └╴← 0x
call Router::doTheSwap(address,address,uint256)(ERC20, 0x0000000000000000000000000000000123123123, 1000000000000000000) (/code/test/recon/TargetFunctions.sol:73)
 ├╴call ERC20::transferFrom(address,address,uint256)(0x0000000000000000000000000000000123123123, Router, 1000000000000000000) (/code/src/Router.sol:8)
 │  └╴error Revert («cent/insufficient-allowance») (/code/src/ERC20.sol:65)
 └╴error Revert («cent/insufficient-allowance») (/code/src/Router.sol:8)
emit Log(«Should work») (/code/lib/chimera/src/CryticAsserts.sol:46)

test_theTransferLibStartP_L_L(): passing
test_theTransfer_b_b(): passing
AssertionFailed(..): passing


Unique instructions: 4166
Unique codehashes: 4
Corpus size: 12
Seed: 7115605297392840780

[2024-11-27 10:00:09.46] Saving test reproducers... Done! (0.004311625s)
[2024-11-27 10:00:09.47] Saving corpus... Done! (1.532492751s)
[2024-11-27 10:00:11.00] Saving coverage... Done! (4.542775461s)
```

### Echidna to Foundry

The resulting test will pass in foundry, but fail in echidna

```solidity
// forge test --match-test test_test_theTransferLibStartP_B_L_0 -vv 
 function test_test_theTransferLibStartP_B_L_0() public {

    test_theTransferLibStartP_B_L();

 }

 // forge test --match-test test_test_theTransfer_b_l_1 -vv 
 function test_test_theTransfer_b_l_1() public {

    test_theTransfer_b_l();

 }

 // forge test --match-test test_test_theTransferLibStartP_L_B_2 -vv 
 function test_test_theTransferLibStartP_L_B_2() public {

    test_theTransferLibStartP_L_B();

 }

 // forge test --match-test test_test_theTransfer_l_b_3 -vv 
 function test_test_theTransfer_l_b_3() public {

    test_theTransfer_l_b();

 }
 ```
