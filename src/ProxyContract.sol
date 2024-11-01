// Proxy Contract
pragma solidity ^0.8.0;

contract Proxy {
  address public implementation;  // Address of the implementation contract

  constructor(address _implementation) {
    implementation = _implementation;
  }

  fallback() external payable {
    // Forward call to the implementation contract
    (bool success, ) = implementation.delegatecall(msg.data);
    require(success, "Call failed");
  }

  function upgrade(address newImplementation) public {
    implementation = newImplementation;
  }
}
