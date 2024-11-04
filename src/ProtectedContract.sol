// Protected contract
pragma solidity ^0.8.0;

contract VulnerableContract {
  mapping(address => uint256) public balances;

  bool unlocked = true;

  modifier lock() {
    require(unlocked, "Contract is locked");
    unlocked = false;
    _;
    unlocked = true;
  }

  function deposit() public payable {
    balances[msg.sender] += msg.value;
  }

  function withdraw(uint256 amount) public lock {
    require(balances[msg.sender] >= amount, "Insufficient balance");

    (bool success, ) = msg.sender.call{value: amount}("");
    require(success, "Transfer failed");

    balances[msg.sender] -= amount;
  }
}
