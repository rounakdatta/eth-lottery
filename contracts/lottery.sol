pragma solidity ^0.4.0;

contract Lottery
{
    mapping(address => uint) UserBetAmount;
    mapping(uint => address) Users;
    
    uint NofUsers = 0;
    uint TotalBetAmount = 0;
    
    address Owner;
    
    function Lottery()
    {
        Owner = msg.sender;
    }
    
    function Bet() public payable
    {
        if(msg.value > 0)
        {
            if(UserBetAmount[msg.sender] == 0)
            {
                Users[NofUsers] = msg.sender; // new user enters into the lottery
            }
            
            UserBetAmount[msg.sender] += msg.value;
            TotalBetAmount += msg.value;
        }
    }
    
    function ShowMeTotalFund() constant returns (uint Funds)
    {
        return TotalBetAmount;
    }
}