# VinceToken Solidity Smart Contract

This Solidity program introduces the VinceToken contract, a versatile implementation of the ERC20 token standard on the Ethereum blockchain. Designed to facilitate token management and governance, VinceToken empowers users with functionalities for minting, burning, transfering tokens, and participating in governance through voting on proposals.

## Description

The VinceToken contract defines a simple Vince token with the following features:
- The contract owner can mint additional VINCE tokens to any address using the mint function.
- Users can burn their tokens using the burn function.
- Token holders can transfer tokens to other addresses using the transfer function.
- Token holders can vote on proposals using the vote function, requiring them to hold tokens.
- Only the contract owner can execute proposals (executeProposal) after verifying their validity.

## Getting Started

### Installing

To get started with this project, you will need to have a Solidity development environment set up. We recommend using Remix, an online Solidity IDE. Follow these steps to install and prepare your environment:

1. **Go to Remix:** Visit the Remix IDE at [Remix](https://remix.ethereum.org/).
2. **Create a new file:** Click on the "+" icon in the left-hand sidebar to create a new file. Save the file with a `.sol` extension (e.g., `VinceToken.sol`).
3. **Copy and paste the template code:** If a template code is provided, Copy the code provided and paste it into your new file.

### Executing program

To run this program, use Remix as follows:

1. **Copy the following code into your file:**

```javascript

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VinceToken is ERC20, Ownable {
    mapping(address => uint256) public votes;
    mapping(bytes32 => bool) public proposals;

    constructor() ERC20("Vince", "VINCE") Ownable(msg.sender) {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function vote(bytes32 proposal) external {
        require(balanceOf(msg.sender) > 0, "Must have tokens to vote");
        votes[msg.sender] += balanceOf(msg.sender);
        proposals[proposal] = true;
    }

    function executeProposal(bytes32 proposal) external onlyOwner {
        require(proposals[proposal], "Proposal does not exist or already executed");
        proposals[proposal] = false; 
    }
}

```

2. **Compile the code:** Click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile VinceToken.sol" button.

3. **Deploy the contract:** Click on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "VinceToken" contract from the dropdown menu, and then click on the "Deploy" button. Provide the necessary constructor parameters.

4. **Interact with the contract:** Once deployed, interact with the contract by:
- Mint: Mint new VINCE tokens.
- Burn: Burn VINCE tokens.
- Transfer: Transfer VINCE tokens to another
- Vote: Vote on a proposal.
- Execute Proposal: Execute a validated proposal.
- Transfer from: Transfer VINCE tokens from one address to another.
- Approve: Approve spender to transfer VINCE tokens on your behalf.
- Balance Of: Get the VINCE token balance of an address.
- Allowance: Check the amount VINCE tokens spender is allowed to spend on behalf of the owner.
- Total Supply: Total supply of VINCE tokens.
- Name: Name of the VINCE token.
- Votes: Total votes held by an address.
- Proposals: Check the status of a proposal.

## Authors

VincyDaniel 
[VincyDaniel](https://www.linkedin.com/in/vince-daniel-del-rosario-815a11205/)

## License

This project is licensed under the VincyDaniel License - see the LICENSE.md file for details
