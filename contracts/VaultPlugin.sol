// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IPlugin.sol";

contract VaultPlugin is IPlugin {
    struct Vault {
        address owner;
        uint256 balance;
    }

    mapping(uint256 => Vault) public vaults;
    uint256 public vaultCounter;

    function performAction(uint256 input) external override returns (uint256) {
        vaultCounter++;
        vaults[vaultCounter] = Vault({
            owner: msg.sender,
            balance: input
        });

        return vaultCounter;
    }

    function getVault(uint256 id) external view returns (address, uint256) {
        Vault memory v = vaults[id];
        return (v.owner, v.balance);
    }
}
