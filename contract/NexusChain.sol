// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Project {
    // Struct to hold user information
    struct User {
        string name;
        bool isRegistered;
    }

    // Mapping from user ID (address) to User struct
    mapping(address => User) private users;

    // Event emitted when a user is registered or updated
    event UserRegistered(address indexed userId, string name);
    event UserUpdated(address indexed userId, string newName);

    // Core Function 1: Register a new user
    function registerUser(string memory _name) public {
        require(!users[msg.sender].isRegistered, "User already registered");
        users[msg.sender] = User(_name, true);
        emit UserRegistered(msg.sender, _name);
    }

    // Core Function 2: Get user information
    function getUserInfo(address _userId) public view returns (string memory name, bool isRegistered) {
        User memory user = users[_userId];
        return (user.name, user.isRegistered);
    }

    // Core Function 3: Update user name
    function updateUserName(string memory _newName) public {
        require(users[msg.sender].isRegistered, "User not registered");
        users[msg.sender].name = _newName;
        emit UserUpdated(msg.sender, _newName);
    }
}
