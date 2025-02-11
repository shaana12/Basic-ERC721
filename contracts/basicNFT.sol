// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// importe l'ERC721 et ERC721URIStorage ajoute la gestion URI utile pour stocker les métadonnées
import {ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// défini un contrat item et hérite du contract ERC721URIStorage qui hérite lui meme du contract ERC721
contract Item is ERC721URIStorage {
    // stock le prochain id de nft à etre minté
    uint256 private _nextTokenId;

    // Fonction exécutée uniquement lors du deploiement du contract 
    constructor() ERC721("Item", "ITEM") {}

    // Fonction permettant de minté un NFT et de l'assigner à un joueur
    function awardItem(address player, string memory tokenURI) public returns (uint256) {
        // stock l'id actuel dans tokenId et incremente _nextTokenId pour le prochain mint
        uint256 tokenId = _nextTokenId++;
        // appelle _mint() d'ERC721 pour créer un nouveau NFT et l'assigner a player
        _mint(player, tokenId);
        // associe un tokenURI (metadonnées) à l'id du NFT (fonction de ERC721URIStorage)
        _setTokenURI(tokenId, tokenURI);

        // retourne l'ID du NFT minté pour permettre à l'appelant de le récupérer et de l'utiliser
        return tokenId;
    }

    
}