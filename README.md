# Solidity Contract Examples: Fallback, Reentrancy, and Proxy Patterns

This repository demonstrates fundamental concepts and security practices in Solidity, covering fallback functions, reentrancy attacks, and proxy patterns. It includes example contracts and tests to help you understand these topics.

## Overview

- **Fallback Function**: A Solidity function that executes when a contract receives Ether or a function call that doesn't match any existing function. Fallback functions can be used for error handling or Ether reception, but improper use can lead to vulnerabilities, such as **Reentrancy Attacks**.
- **Reentrancy Attack**: A type of attack where an attacker repeatedly calls into a contract before the previous call completes, potentially draining funds. Preventing reentrancy requires careful design of fallback functions and external calls.
- **Proxy Contracts**: A pattern that uses the fallback function to delegate calls to an implementation contract. Proxies allow upgradable contract structures and flexible handling of unknown function calls.

## Documentation

Refer to the [Solidity By Example](https://solidity-by-example.org/fallback/).
