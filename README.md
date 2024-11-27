# Prank Echidna vs Foundry Bug

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
Analyzing contract: /code/test/recon/CryticTester.sol:CryticTester
[2024-11-27 09:35:14.97] Running slither on .... Done! (12.673080158s)
Loaded 1 transaction sequences from echidna/reproducers
Loaded 4 transaction sequences from echidna/coverage
test_theTransferLib(): passing
test_theTransferLibStartP(): failed!💥  
  Call sequence:
    CryticTester.test_theTransferLibStartP()

Traces: 
call HEVM::startPrank(0x0000000000000000000000000000000000000014) (/code/test/recon/TargetFunctions.sol:50)
 └╴← 0x
call Router::doTheSwapWithExternalLibrary(address,address,uint256)(ERC20, 0x000000000000000000000000000000000000001e, 1000000000000000000) (/code/test/recon/TargetFunctions.sol:51)
 ├╴delegatecall 0x0000000000000000000000000000000000000F01::0x4ec109f4000000000000000000000000b4c79dab8f259c7aee6e5b2aa729821864227e84000000000000000000000000000000000000000000000000000000000000001e0000000000000000000000000000000000000000000000000de0b6b3a7640000 (/code/src/Router.sol:11)
 │  ├╴call ERC20::transferFrom(address,address,uint256)(0x000000000000000000000000000000000000001e, Router, 1000000000000000000) <no source map>
 │  │  └╴error Revert («cent/insufficient-allowance») (/code/src/ERC20.sol:65)
 │  └╴error Revert («cent/insufficient-allowance») <no source map>
 └╴error Revert («cent/insufficient-allowance») (/code/src/Router.sol:11)
emit Log(«Should work») (/code/lib/chimera/src/CryticAsserts.sol:46)

test_theTransfer(): passing
test_theTransfer_startP(): passing
AssertionFailed(..): passing
```

### Echidna to Foundry

The resulting test will pass in foundry, but fail in echidna

```solidity
// forge test --match-test test_test_theTransferLibStartP_0 -vv 
 function test_test_theTransferLibStartP_0() public {

    test_theTransferLibStartP();

 }
 ```