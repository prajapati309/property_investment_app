// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./PropertyToken.sol";

contract PropertyFactory {
    event PropertyCreated(
        address indexed token,
        string name,
        string symbol,
        uint256 supply
    );

    function createProperty(
        string memory name,
        string memory symbol,
        uint256 supply
    ) external returns (address) {
        PropertyToken token = new PropertyToken(
            name,
            symbol,
            supply,
            msg.sender
        );

        emit PropertyCreated(address(token), name, symbol, supply);
        return address(token);
    }
}
