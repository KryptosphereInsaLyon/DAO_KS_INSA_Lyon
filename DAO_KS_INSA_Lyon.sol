pragma solidity ^0.8.17;

contract DAO_KS_INSA_Lyon {

    uint constant prixCreerVote = 2;

    struct proposition{
        address createur;
        string nom;
        uint id;
        uint dateDeCreation;
        uint16 pour;
        uint16 contre;
    }

    proposition[] propositions;

    

    //un pelo propose un vote et paye prixCreerVote
    function creerVote(address _createur, string _nom) public {}

    //choisi un master parmi les plus riches
    function selectionMaster() public {}

    //le master attribue les votes à la fin de la séance
    function attributionKIL() public {}

    //le vote a lieu, le créateur ne peut pas voter
    function voter(uint _propId, uint _nbKIL, bool _choix) public {}

}