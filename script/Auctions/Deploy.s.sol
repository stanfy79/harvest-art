// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../../src/Auctions.sol";
import "../Factory.s.sol";

contract Deploy is Factory {
    Auctions auctions;

    function run() external returns (address) {
        bytes memory initCode = abi.encodePacked(type(Auctions).creationCode);
        bytes memory args = abi.encode(
            vm.envAddress("ADDRESS_DEPLOYER"), 
            vm.envAddress("ADDRESS_BARN"), 
            vm.envAddress("ADDRESS_CONTRACT_BID_TICKET")
        );
        bytes32 salt = 0x0000000000000000000000000000000000000000ef1cd16ea046cb45440000c0;

        return deploy("Auctions", initCode, salt, args);
    }
}
