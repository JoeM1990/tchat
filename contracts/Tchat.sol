// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Tchat {
    struct Message {
        
        address owner;
        string message;
        uint256 timestamp;
        address recipient;
    }


   
    uint256 private _indexMessage;
   
    mapping(uint256 => Message) private _messages;
    mapping(address => uint256[]) private _userMessages;


    event MessageAdded(address sender, address receiver);

    constructor() {}

    function addMessage(string memory text, address to) public {
        
        require(
            msg.sender != to,
            "on ne peut pas envoyer un message a soit meme"
        );
       
        Message memory message = Message(msg.sender, text, block.timestamp, to);
    
        _messages[_indexMessage] = message;
       
        _userMessages[msg.sender].push(_indexMessage);
        _userMessages[to].push(_indexMessage);
       
        emit MessageAdded(msg.sender, to);
       
        _indexMessage++;
    }


    function getMessages() public view returns (Message[] memory) {
       
        uint256 length = _userMessages[msg.sender].length;
       
        require(length > 0, "aucun message");


       
        Message[] memory myMessages = new Message[](length);
        for (uint256 index = 0; index < length; index++) {
            
            uint256 messageIndex = _userMessages[msg.sender][index];
            myMessages[index] = _messages[messageIndex];
        }
        return myMessages;
    }
} 