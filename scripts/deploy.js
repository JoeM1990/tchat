const hre = require("hardhat");

async function main() {

  const Contract = await hre.ethers.getContractFactory("Tchat");
  const tchat = await Contract.deploy();

  await tchat.deployed();
  console.log("Tchat deployed to:", tchat.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }); 
