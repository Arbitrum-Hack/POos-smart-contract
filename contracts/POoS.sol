// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract POoS is ERC1155, Ownable {
    constructor(string memory URI, address owner) ERC1155(URI) Ownable(owner) {}

    function mint(address account, uint256 id, uint256 amount)
        public
        onlyOwner
    {
        _mint(account, id, amount, "");
    }
}

contract POoSFactory {



    mapping (address => address[]) public ownerToDeployedContract;
    event NewPOoSTokenCreated (address, string, address);

    function createNewPOoS(string memory URI) external returns(POoS){
        POoS newPOoS = new POoS (URI, msg.sender);
        ownerToDeployedContract[msg.sender].push(address(newPOoS));
        emit NewPOoSTokenCreated (address(newPOoS), URI, msg.sender);
        return newPOoS;
    }



    
}