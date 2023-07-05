//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import "../../src/Challenge.sol";

contract Handler is Test {
    LessonTwelveHelper victim;
    error Found(uint256 number);
    constructor(LessonTwelveHelper _victim) {
        victim = _victim;
    }

    function testExploit(uint128 number) public view {

        try victim.hellFunc(number) returns (uint256) {
            console.log("inside");
        }
        catch {
            revert Found(number);
        }
    }
}