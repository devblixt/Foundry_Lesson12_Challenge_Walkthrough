//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import "../src/Challenge.sol";

contract Deployer is Script {
    
    function run() external returns (LessonTwelveHelper) {
        vm.startBroadcast();
        LessonTwelveHelper victim = new LessonTwelveHelper();
        vm.stopBroadcast();
        return victim;
    }

}