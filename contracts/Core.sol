// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./IPlugin.sol";

contract Core is Ownable {
    IPlugin[] public plugins;

    event PluginAdded(address plugin);  // <-- Add this line

    constructor(address initialOwner) Ownable(initialOwner) {}

    function addPlugin(address plugin) external onlyOwner {
        plugins.push(IPlugin(plugin));
        emit PluginAdded(plugin);       // <-- And this line
    }

    function updatePlugin(uint256 index, address plugin) external onlyOwner {
        require(index < plugins.length, "Invalid index");
        plugins[index] = IPlugin(plugin);
    }

    function removePlugin(uint256 index) external onlyOwner {
        require(index < plugins.length, "Invalid index");
        plugins[index] = plugins[plugins.length - 1];
        plugins.pop();
    }

    function getPluginsCount() external view returns (uint256) {
        return plugins.length;
    }

    function executePlugin(uint256 pluginId, uint256 input) external returns (uint256) {
        require(pluginId < plugins.length, "Plugin does not exist");
        return plugins[pluginId].performAction(input);
    }
}
