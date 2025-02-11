import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config(); // Utilisation d'un fichier .env pour sécuriser ta clé privée

const config: HardhatUserConfig = {
  solidity: "0.8.28",
};

module.exports = {
  solidity: "0.8.20",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`, // Utilise un fournisseur comme Alchemy ou Infura
      accounts: [process.env.PRIVATE_KEY], // Stocke ta clé privée dans un fichier .env
    },
  },
};

export default config;
