pragma solidity ^0.8.0;

contract IdentityManagement {
    // Define a structure for the identity
struct Identity {
    address owner;
    string firstName;
    string lastName;
    uint256 age;
}

// Define variables for the contract
uint256 public totalIdentities;
mapping (uint256 => Identity) public identities;
mapping (address => uint256) public identityIndex;

// Function to create a new identity
function createIdentity(string memory firstName, string memory lastName, uint256 age) public {
    totalIdentities++;
identities[totalIdentities] = Identity(msg.sender, firstName, lastName, age);
    identityIndex[msg.sender] = totalIdentities;
}

// Function to update an identity
function updateIdentity(string memory firstName, string memory lastName, uint256 age) public {
    require(identityIndex[msg.sender] > 0, "Identity not found");
    uint256 index = identityIndex[msg.sender];
    identities[index].firstName = firstName;
    identities[index].lastName = lastName;
    identities[index].age = age;
}

// Function to get the owner of an identity
function getIdentityOwner(uint256 identityId) public view returns (address) {
    require(identityId <= totalIdentities, "Identity not found");
    return identities[identityId].owner;
}

// Function to get the details of an identity
function getIdentityDetails(uint256 identityId) public view returns (string memory, string memory, uint256) {
    require(identityId <= totalIdentities, "Identity not found");
    return (identities[identityId].firstName, identities[identityId].lastName, identities[identityId].age);
}

// Function to grant access to an identity
function grantAccess(uint256 identityId, address recipient) public {
    require(identityId <= totalIdentities, "Identity not found");
    require(identities[identityId].owner == msg.sender, "Only the owner can grant access");
    require(identityIndex[recipient] > 0, "Recipient does not have an identity");
    // Grant access by storing the identity index in a mapping
    // with the recipient's address as the key
    identityIndex[recipient] = identityId;
}
}
