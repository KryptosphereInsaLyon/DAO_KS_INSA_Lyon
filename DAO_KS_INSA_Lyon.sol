// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "KSIL.sol";

contract DAO_KS_INSA_Lyon is KSIL{

    struct Proposition {
        address createur;
        string nom;
        uint id;
        uint dateDeCreation;
        bool status;
        uint16 pour;
        uint16 contre;
    }

    Proposition[] public propositions;
    uint _propCompteur = 0;

    uint public prixCreerVote = 2;
    
    address master = selectionMaster();

    constructor() {
        propositions.push(Proposition({
            createur: msg.sender,
            nom: "test",
            id: 0,
            dateDeCreation: block.timestamp,
            pour: 2,
            contre: 1
            status : true
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
            status : true
        }));
        _propCompteur += 1;
    }
    
    modifier master() {
        require(msg.sender == master );
        _;
    }

    //choisi un master parmi les plus riches
    function selectionMaster() public {}

    //le master attribue les votes à la fin de la séance
    function attributionKIL(string nom, uint256 amount) public master {
        _mint(nomToAddress[nom], amount);
    }

    //le vote a lieu, le créateur ne peut pas voter
    function voter(uint _propId, uint16 _nbKIL, bool _choix) public {
         if(propositions[_propId].dateDeCreation + 604800 <= block.timestamp){ 
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
    
    //permet d'ajouter un membre de l'asso
    function ajouterMembre(string _nom, address _adresse) public master {
        nomToAddress[_nom] = _adresse;
    }
}
