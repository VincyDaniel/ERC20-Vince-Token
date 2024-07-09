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
