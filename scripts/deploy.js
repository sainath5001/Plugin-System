// scripts/deploy.js
const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();

    console.log("Deploying contracts with:", deployer.address);

    const ExamplePlugin = await hre.ethers.getContractFactory("ExamplePlugin");
    const examplePlugin = await ExamplePlugin.deploy();  
    await examplePlugin.deployed();                     
    console.log("ExamplePlugin deployed to:", examplePlugin.address);

    const VaultPlugin = await hre.ethers.getContractFactory("VaultPlugin");
    const vaultPlugin = await VaultPlugin.deploy();
    await vaultPlugin.deployed();
    console.log("VaultPlugin deployed to:", vaultPlugin.address);

    const Core = await hre.ethers.getContractFactory("Core");
    const core = await Core.deploy(deployer.address);
    await core.deployed();
    console.log("Core deployed to:", core.address);

    
    const tx1 = await core.addPlugin(examplePlugin.address);
    await tx1.wait();  // it will Wait for transaction confirmation
    console.log(`Added ExamplePlugin (${examplePlugin.address}) to Core.`);

    const tx2 = await core.addPlugin(vaultPlugin.address);
    await tx2.wait();
    console.log(`Added VaultPlugin (${vaultPlugin.address}) to Core.`);

    console.log("All contracts deployed and plugins registered in Core.");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error("Error during deployment:", error);
        process.exit(1);
    });
