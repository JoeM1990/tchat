require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-web3");
require("hardhat-abi-exporter");


task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});



/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    version: "0.8.4",
    settings: {
   
      optimizer: {
        enabled: true,
        runs: 1,
      },
      
    },
  },
  networks: {
    hardhat: {
      chainId: 1337,
      accounts: [
        {
          balance: "100000000000000000000",
          
          privateKey:
            "4149e3ed85d04f91783a1494e961aaee0ee1ace5890106965c68ba30e45d9210",
        },
        {
          balance: "300000000000000000000",
          
          privateKey:
            "5166483b80cba5a1b5833f6cd2765d71c9820085d7437bed99ae288b975fba52",
        },
        {
          balance: "1000000000000000000",
         
          privateKey:
            "e7cb0d971d967d04ac647fa7c5f1adfc2dcb126737b70ddfc4bbee03f9740ed1",
        },
        {
          balance: "20000000000000000000",
        
          privateKey:
            "6c54bbcc10f0fdbff9b150be32a2381cb46af0f4d50b0858c01c850945008d57",
        },
      ],
    },
  },
  abiExporter: {
    
    path: "./data/abi",
    clear: true,
    flat: true,
    only: [],
    spacing: 2,
  },
}; 