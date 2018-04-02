### Decentralized Lottery

#### Smart Contract
- ```Lottery()``` constuctor accepts the winning number from the Owner and stores it as SHA3 hash (used in Solidity as ```keccak256(payload)```).
- ```requestToken()``` can be called by participants of the lottery to request any amount of tokens (total 1000000 tokens available). Here, 1 token costs 1 ether and in case of fractional payment, the excess is refunded.
- ```makeGuess()``` can be called by participants to guess a number and spend a token. There's the security of refund in case the number is out of range.
- ```closeGame()``` can be called by the Owner to stop the lottery and find out the winner by matching the hash.
- ```winnerAddress()``` will fetch the address of the winning user.
- ```getPrice()``` can be called by the winner to receive 50% of the total ether in the contract in his / her account and transferring the remaining 50% to the Owner address.
- <b>No winner</b> : The entire amount of ethers present in the smart contract is transferred to the Owner.

#### Issues
- In case multiple users guess the winning number, the last one to guess will be declared the winner.
- The user won't be able to request tokens once the 1000000 tokens are exhausted.

Test it on [Remix IDE](https://remix.ethereum.org/) or through Truffle.
