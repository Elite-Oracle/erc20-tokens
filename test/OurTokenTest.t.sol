// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";
import {Test, console} from "../lib/forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

// Interface for a mintable token
interface MintableToken {
    function mint(address, uint256) external;
}

/**
 * @title OurTokenTest
 * @notice This contract is for testing the OurToken contract
 * @dev It inherits from StdCheats and Test from the forge-std library
 */
contract OurTokenTest is StdCheats, Test {
    // The starting amount of tokens for Bob
    uint256 BOB_STARTING_AMOUNT = 100 ether;

    // The OurToken contract
    OurToken public ourToken;

    // The DeployOurToken contract
    DeployOurToken public deployer;

    // The address of the deployer
    address public deployerAddress;

    // The addresses of Bob and Alice
    address bob;
    address alice;

    /**
     * @notice Sets up the test by deploying OurToken and giving Bob some tokens
     */
    function setUp() public {
        // Deploy the OurToken contract
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        // Create addresses for Bob and Alice
        bob = makeAddr("bob");
        alice = makeAddr("alice");

        // Get the address of the deployer
        deployerAddress = vm.addr(deployer.deployerKey());

        // Prank the deployer and transfer some tokens to Bob
        vm.prank(deployerAddress);
        ourToken.transfer(bob, BOB_STARTING_AMOUNT);
    }

    /**
     * @notice Tests that the initial supply of OurToken is correct
     */
    function testInitialSupply() public {
        assertEq(ourToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    /**
     * @notice Tests that users can't mint new tokens
     */
    function testUsersCantMint() public {
        // Expect a revert when trying to mint new tokens
        vm.expectRevert();
        MintableToken(address(ourToken)).mint(address(this), 1);
    }

    /**
     * @notice Tests the allowance functionality of OurToken
     */
    function testAllowances() public {
        uint256 initialAllowance = 1000;

        // Alice approves Bob to spend tokens on her behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);
        uint256 transferAmount = 500;

        // Alice transfers some tokens from Bob to herself
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);

        // Check that the balances and allowances are correct
        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), BOB_STARTING_AMOUNT - transferAmount);
        assertEq(ourToken.allowance(bob, alice), initialAllowance - transferAmount);
    }
}
