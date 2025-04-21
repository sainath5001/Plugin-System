🔌 Modular Plugin System with Vault Creation Plugin
This project demonstrates a modular smart contract architecture using Solidity, where a central Core contract manages a registry of external Plugins and can dynamically execute them. The system also includes a Vault Creation Plugin that allows for the deployment of unique vault contracts.

Built using:
Solidity ^0.8.x
Hardhat (development & testing)
Node.js v16.x or later

🚀 Features
💡 Dynamic Plugin Execution
Allows the Core contract to execute logic from registered plugins at runtime.

🏦 Vault Creation Plugin
Demonstrates how plugins can extend functionality, including the ability to deploy unique vault contracts directly from the Core.

🔥 Modular and Extensible Design
New plugins can be registered and executed without redeploying the Core.

⚙️ Setup Instructions
1️⃣ Clone the Repository
git clone https://github.com/sainath5001/Plugin-System.git 
cd plugin

2️⃣ Install Dependencies
npm install

3️⃣ Compile the Smart Contracts
npx hardhat compile

💡 Note:
If you face any compilation issues, try cleaning the project first:
npx hardhat clean
npx hardhat compile

4️⃣ Start Local Hardhat Node
Before deploying, make sure your local Ethereum node is running:

npx hardhat node
This will launch a local node at http://127.0.0.1:8545.

5️⃣ Deploy the Contracts
Once the node is running, deploy the contracts to your local blockchain:
npx hardhat run scripts/deploy.js --network localhost

6️⃣ Run the Tests
To verify the functionality of your contracts:
npx hardhat test

🗂️ Network Configuration
Make sure your hardhat.config.js is correctly set up:

module.exports = {
  solidity: "0.8.0",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
      accounts: ["<PRIVATE_KEY>"]  // Replace this with your Hardhat node's private key
    }
  }
};


🧑‍💻 Troubleshooting
❌ Error: Cannot connect to the network localhost

💡 Solution:
Ensure your local Hardhat node is running:
npx hardhat node

Double-check your hardhat.config.js URL and account settings.

❌ Error: Cannot read properties of undefined (reading 'executePlugin')
💡 Solution:
Ensure the plugin contracts are deployed successfully.
Confirm that the plugin address is added to the Core contract before attempting execution.



