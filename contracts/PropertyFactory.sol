// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./PropertyToken.sol";

contract PropertyFactory {
    event PropertyCreated(
        uint256 indexed propertyId,
        address tokenAddress
    );

    function createPropertyToken(
        uint256 propertyId,
        string memory name,
        string memory symbol,
        uint256 totalSupply
    ) external returns (address) {

        PropertyToken token = new PropertyToken(
            propertyId,
            name,
            symbol,
            totalSupply,
            msg.sender
        );

        emit PropertyCreated(propertyId, address(token));
        return address(token);
    }
}
