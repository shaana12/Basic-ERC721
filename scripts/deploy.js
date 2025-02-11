const hre = require("hardhat");

async function main() {
    const Item = await hre.ethers.getContractFactory("Item");
    const item = await Item.deploy();

    await item.waitForDeployment();

    console.log("MonNFT déployé à:", await item.getAddress());
    // 0xA8724e1BaC871eDF09E3A6Df9681Fba580E6b9B3
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
