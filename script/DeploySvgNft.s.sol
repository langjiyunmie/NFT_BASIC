pragma solidity ^0.8.18;

import {Script} from "lib/forge-std/src/Script.sol";
import {MoodNft} from "src/MoodNFT.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract DeploySvgNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("images/sad.svg");
        string memory happySvg = vm.readFile("images/happy.svg");
        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(svgToImage(sadSvg), svgToImage(happySvg));
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImage(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encode = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseURL, svgBase64Encode));
    }
}
