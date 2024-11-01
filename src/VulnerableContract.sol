// Vulnerable contract
pragma solidity ^0.8.0;

contract VulnerableContract {
  mapping(address => uint256) public balances;

  // Function to deposit funds
  function deposit() public payable {
    balances[msg.sender] += msg.value;
  }

  // Vulnerable withdraw function
  function withdraw(uint256 amount) public {
    require(balances[msg.sender] >= amount, "Insufficient balance");

    // Attempt to send Ether to msg.sender
    (bool success, ) = msg.sender.call{value: amount}("");
    require(success, "Transfer failed");

    // Update balance after sending Ether
    balances[msg.sender] -= amount;
  }
}
