pragma solidity ^0.8.18;

import {Test, console} from "lib/forge-std/src/Test.sol";
import {DeployBaseNFT} from "script/DeployBaseNFT.s.sol";
import {BaseNFT} from "src/BaseNFT.sol";

contract BaseNFTtest is Test {
    DeployBaseNFT public deployer;
    BaseNFT public nft;
    address public USER = makeAddr("user");
    string public constant URL = "ipfs://QmYr3CviZ116rfKzNg4AsK6Z6XY33n7torQHVowFPyEdkT/";

    function setUp() public {
        deployer = new DeployBaseNFT();
        nft = deployer.run();
    }

    function testNFTname() public view {
        string memory name = "Doge";
        string memory symbol = "DOG";
        assertEq(name, nft.name()); //字符串相当于就是字节的数组，数组之间是不能直接进行比较的
        assertEq(symbol, nft.symbol()); //assertEq 适用于字符串的比较,assert 不行
            //assert(keccak256(abi.encodePacked(..)) == keccaka(abi.encodePacked(..)))
    }

    function testMintNFT() public {
        vm.prank(USER);
        nft.mintNFT(URL);
        assert(nft.balanceOf(USER) == 1);
        assert(nft.ownerOf(0) == USER);
        //assert(keccak256(abi.encodePacked(URL)) == keccak256(abi.encodePacked(nft.tokenURI(0))));
        assertEq(nft.tokenURI(0), URL);
    }
}
