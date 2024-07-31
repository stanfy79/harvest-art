// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../../src/Auctions.sol";
import "./Deploy.s.sol";

contract DeployTestnet is Script {
    Auctions auctions;

    function run() external {
        new Deploy().run();

        vm.startBroadcast();

        auctions = Auctions(vm.envAddress("ADDRESS_CONTRACT_AUCTIONS"));
        auctions.setMinStartingBid(0.001 ether);
        auctions.setMinBidIncrement(0.001 ether);
        auctions.setAuctionDuration(1 hours);

        vm.stopBroadcast();
    }
}
