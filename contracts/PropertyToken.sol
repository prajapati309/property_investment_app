// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PropertyToken is ERC20, Ownable {
    uint256 public propertyId;
    uint256 public maxSupply;

    constructor(
        uint256 _propertyId,
        string memory name_,
        string memory symbol_,
        uint256 totalSupply_,
        address owner_
    )
        ERC20(name_, symbol_)
        Ownable(owner_)
    {
        propertyId = _propertyId;
        maxSupply = totalSupply_;

        _mint(owner_, totalSupply_ * 10 ** decimals());
    }
}
