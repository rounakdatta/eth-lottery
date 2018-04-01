pragma solidity ^0.4.0;

contract Lottery
{
    address Owner;
    modifier onlyowner()
    {
        if(msg.sender == Owner)
        {
            _;
        }
        else
        {
            throw;
        }
       
    }
    
    modifier onlyuser()
    {
        if(msg.sender != Owner)
        {
            _;
        }
        else
        {
            throw;
        }
       
    }
    
    mapping(address => uint256) TokenBalances;
    mapping(address => uint256) UserGuesses;
    
    uint private winN;
    
    function Lottery(uint winningNumber)
    {
        Owner = msg.sender;
        TokenBalances[Owner] = 1000000;
        
        winN = winningNumber;
    }
    
    
    function requestToken() payable onlyuser
    {
        uint value = msg.value;
        
        uint ethToSend = value/ 1 ether;
        
        if(TokenBalances[Owner] >= ethToSend)
        {
            TokenBalances[Owner] -= ethToSend;
            TokenBalances[msg.sender] += ethToSend;
            
            if((value % 1 ether) != 0)
            {
               msg.sender.transfer(value % 1 ether);
            }
            
        }
      
    }
    
    function makeGuess(uint guess) payable 
    {
        if(guess >= 1 && guess <= 1000000)
        {
            if(TokenBalances[msg.sender] > 0)
            {
                UserGuesses[msg.sender] = guess;
                TokenBalances[msg.sender] -= 1;
            }
        }
    }
    
    function queryTokenBalance() public constant returns (uint256 myToken)
    {
        return TokenBalances[msg.sender];
    }
    
    function () payable
    {
        // fallback function
    }
}