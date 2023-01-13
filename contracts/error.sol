// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract ErrorDemo {
    mapping(uint256 => address) _owners;
    // error TransferNotOwner(); 
    // error TransferNotOwner(address sender);
    
    function transferOwner1(uint256 tokenId, address newOwner) public {
        if(_owners[tokenId] != msg.sender){
            // revert TransferNotOwner();
            revert("Transfer1 Not Owner");
        }
        _owners[tokenId] = newOwner;
    }

    function transferOwner2(uint256 tokenId, address newOwner) public {
        require(_owners[tokenId] == msg.sender, "Transfer Not Owner");
        _owners[tokenId] = newOwner;
    }

    function transferOwner3(uint256 tokenId, address newOwner) public {
        assert(_owners[tokenId] == msg.sender);
        _owners[tokenId] = newOwner;
    }

    error InFuncError(string);
    function transferOwner4(uint256 tokenId, address newOwner) public {
        if(_owners[tokenId] != msg.sender){
            revert InFuncError("custom error information");
        }
        _owners[tokenId] = newOwner;
    }
}