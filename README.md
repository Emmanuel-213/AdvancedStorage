**Opening Development Environment**

I opened my SimpleStorage.sol contract file from my previous project in Remix IDE as the base for my AdvancedStorage project.

**Implement Mappings**

I added a mapping "nameToFavoriteNumberMapping". I created a function called setNameToFavoriteNumber to store people names and their associated favorite numbers and I made it public. I used variable(string) "name" to take the 
person's name and favoriteNumber(uint256) to store the person's favoriteNumber.

**Add and Emit Events**

I created an event and named it NumberUpdated, it's function is to logs when the favorite number is updated. I created a function and named it storeNewNumber to emit the NumberUpdated event.

**Utilize Storage, Memory, and Calldata**

I created a "store" Function to store a number in the storage variable, after that I created another function called "updateNumber" that uses a memory variable for temporary calculations. TempNumber was the name of the variable used. Finally I created a function "concatenateString" that also uses a calldata variable.

**Compile, Test, and Push to GitHub**

I clicked on the solidity compiler and compiled  SimpleStorage.sol and there were no errors. Under deploy and run transactions, I changed the environment to Remix VM(London), when I tried deploying,
I received an error which said "Invalid opcode, The execution might have thrown OR the EVM version used by the selected environment is not compatible with the compiler EVM version." so I changed the enviroment back to Remix VM(Cancun) and deployed successfully. I created a public repository and named it "AdvancedStorage" and I pushed my code to Github.
