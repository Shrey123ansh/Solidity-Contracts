// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Polling{
    string viewPoint;
    address[]  voted;
    bool[]  votes;
    uint trueVotes=0;

    constructor(){
        viewPoint="1";
    }

    function vote(bool _vote) external {
        require(!alreadyVoted(msg.sender),"Revert Plzz");
        voted.push(msg.sender);
        votes.push(_vote);

        if(_vote){
            trueVotes+=1;
        }
    }
    
    function voteCount() external view returns(uint){
        return voted.length;
    }

    function currentStandings() external view returns(uint) {
        return (trueVotes*100/votes.length*100)/100;
    }

    function alreadyVoted(address x) internal view returns(bool){
        for(uint i= 0;i<votes.length;i++){
            if(voted[i]==x){
                return true;
            }
        }
        return false;
    }

}
