// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPlugin {
    function performAction(uint256 input) external returns (uint256);
}
