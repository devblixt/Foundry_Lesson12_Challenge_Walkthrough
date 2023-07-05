//SPDX-License-Identifier: MIT

import {Test, console} from "forge-std/Test.sol";
import {Deployer} from "../../script/Deploy.sol";
import "../../src/Challenge.sol";
import {Handler} from "./Handler.t.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";


pragma solidity ^0.8.18;

contract ExploitPatrick is StdInvariant,Test{
    error Found(uint128 number);
    LessonTwelveHelper private _victim;
    Handler handler;
    address prankaddr;
    function setUp() external {
        Deployer dep = new Deployer();
        _victim = dep.run();
        handler = new Handler(_victim);
        prankaddr = msg.sender;
        targetContract(address(handler));
    }

    function test_dummy(uint128 number) public {
        vm.startPrank(prankaddr);
        try _victim.hellFunc(number) returns (uint256) {
            console.log("inside");
        }
        catch {
            revert Found(number);
        }
        vm.stopPrank();
    }

    function test_confirm() public {
        uint128 num = 99;
                vm.startPrank(prankaddr);
        try _victim.hellFunc(num) returns (uint256) {
            console.log("inside");
        }
        catch {
            revert Found(num);
        }
        vm.stopPrank();
    }

}