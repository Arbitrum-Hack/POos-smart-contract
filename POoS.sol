// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract POoS is ERC1155, Ownable {
    constructor(string memory URI, address owner) ERC1155(URI) Ownable(owner) {}

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }
}

contract POoSFactory {
    event NewPOoSTokenCreated (address, string, address);
    function CreateNewToken(string memory URI) external returns(POoS){
        POoS newPOoSToken = new POoS (URI, msg.sender);
        emit NewPOoSTokenCreated (address(newPOoSToken), URI, msg.sender);
        return newPOoSToken;
    }

    
}