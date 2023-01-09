// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "KSIL.sol";

contract DAO_KS_INSA_Lyon is KSIL{

    struct Proposition {
        address createur;
        string nom;
        uint id;
        uint dateDeCreation;
        uint16 pour;
        uint16 contre;
    }

    Proposition[] public propositions;
    uint _propCompteur = 0;

    uint public prixCreerVote = 2;

    constructor() {
        propositions.push(Proposition({
            createur: msg.sender,
            nom: "test",
            id: 0,
            dateDeCreation: block.timestamp,
            pour: 2,
            contre: 1
        }));
        _propCompteur += 1;
    }

    //un pelo propose un vote et paye prixCreerVote
    function creerVote(string memory _nom) public {
        propositions.push(Proposition({
            createur: msg.sender,
            nom: _nom,
            id: _propCompteur,
            dateDeCreation: block.timestamp,
            pour: 0,
            contre: 0
        }));
        _propCompteur += 1;
    }

    //choisi un master parmi les plus riches
    function selectionMaster() public {}

    //le master attribue les votes à la fin de la séance
    function attributionKIL() public {}

    //le vote a lieu, le créateur ne peut pas voter
    function voter(uint _propId, uint16 _nbKIL, bool _choix) public {
        //Le créateur ne peut pas voter
        require (propositions[_propId].createur == msg.sender);
        //Ajout des pour/contre et dépense des jetons de l'appelant
        transfer(address(this), _nbKIL);
        if (_choix) {
            propositions[_propId].pour += _nbKIL;
        } else {
            propositions[_propId].contre += _nbKIL;
        }
    }
}
