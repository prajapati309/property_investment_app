// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PropertyToken is ERC20, Ownable {
    uint256 public rentPool;

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 totalSupply_,
        address owner_
    ) ERC20(name_, symbol_) {
        _mint(owner_, totalSupply_);
        transferOwnership(owner_);
    }

    function depositRent() external payable {
        rentPool += msg.value;
    }

    function claimRent() external {
        uint256 holderBalance = balanceOf(msg.sender);
        require(holderBalance > 0, "No tokens");

        uint256 share = (rentPool * holderBalance) / totalSupply();
        rentPool -= share;

        payable(msg.sender).transfer(share);
    }
}
