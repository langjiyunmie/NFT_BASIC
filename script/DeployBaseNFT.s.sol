pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {BaseNFT} from "src/BaseNFT.sol";

contract DeployBaseNFT is Script {
    function run() external returns (BaseNFT) {
        vm.startBroadcast();
        BaseNFT nft = new BaseNFT();
        vm.stopBroadcast();
        return nft;
    }
}
