// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25; // This allows any version from 0.8.25 to less than 0.9.0

contract SimpleStrorage {
    uint256 private favoriteNumber; //state a variable to store number
    uint256[] public favoriteNumbers; // Dynamic array to store multiple favorite numbers

    // Struct to store a person’s name and their favorite number
    struct Person {
        string name; // Person's name
        uint256 favoriteNumber; // Their favorite number
    }

    Person[] public people; // Array of Person structs to store multiple people's data

    // Enum to manage contract states (Active or Inactive)
    enum ContractState {
        Active, // State representing an active contract
        Inactive // State representing an inactive contract
    }

    ContractState public state; // State variable to store the current contract state

    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function isGreaterThan(uint256 _compareValue) public view returns (bool) {
        if (favoriteNumber > _compareValue) {
            return true;
        } else {
            return false;
        }
    }

    function sumToFavoriteNumber() public view returns (uint256) {
        uint256 sum = 0; //this is a local variable
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum = sum + i;
        }
        return sum;
    }

    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function"; // this can be accessed within this contract or derived contracts
    }

    function callInternalFunction() public pure returns (string memory) {
        return internalFunction(); //this will call the internal function from within the contract
    }

    function externalFunction() external pure returns (string memory) {
        return "This is an external function"; // this can only be called from outside the contract
    }

    function testExternalFunction() public view returns (string memory) {
        return this.externalFunction(); // this will call the external function within the contract using 'this'
    }

    function addFavoriteNumber(uint256 _number) public {
        favoriteNumbers.push(_number);
    }

    function returnNumbers() public view returns (uint256[] memory) {
        return favoriteNumbers;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person(_name, _favoriteNumber));
    }

    function activateContract() public {
        state = ContractState.Active;
    }

    function deactivateContract() public {
        state = ContractState.Inactive;
    }

    function isActive() public view returns (bool) {
        return state == ContractState.Active;
    }

    //adding mapping to store names and their associated favorite numbers
    mapping(string => uint256) public nameToFavoriteNumberMapping;

    function setNameToFavoriteNumber(
        string memory _name,
        uint256 _favoriteNumber
    ) public {
        nameToFavoriteNumberMapping[_name] = _favoriteNumber;
    }

    //adding events
    event NumberUpdated(uint256 newNumber, address updatedBy);

    function storeNewNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        emit NumberUpdated(_favoriteNumber, msg.sender);
    }

    // Function to store a number in the storage variable
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // Function that uses a memory variable
    function updateNumber(uint256 _newNumber) public pure returns (uint256) {
        // Memory variable is used for temporary calculations
        uint256 tempNumber = _newNumber + 5;
        return tempNumber;
    }

    // Function that uses a calldata variable
    function concatenateString(string calldata _inputString)
        public
        pure
        returns (string memory)
    {
        // Memory variable to store the concatenated result
        string memory newString = string(
            abi.encodePacked(_inputString, " is Beautiful!")
        );
        return newString;
    }
}
