pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BaseNFT} from "src/BaseNFT.sol";

contract MintBaseNFT is Script {
    string public constant tokenURL = "ipfs://QmYr3CviZ116rfKzNg4AsK6Z6XY33n7torQHVowFPyEdkT/";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BaseNFT", block.chainid);
        mintNFTonContract(mostRecentlyDeployed);
    }

    function mintNFTonContract(address contractAddress) internal {
        vm.startBroadcast();
        BaseNFT(contractAddress).mintNFT(tokenURL);
        vm.stopBroadcast();
    }
}
