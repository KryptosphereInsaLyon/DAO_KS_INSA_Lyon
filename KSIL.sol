// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KSIL is ERC20, Ownable {
    constructor() ERC20("DAO_KS_INSA_Lyon", "KSIL") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function masterMint() {}
}
