// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract Squads{

    struct squadMemberInfo{
        string memberName;
        address memberAddress;
    }
    struct squadInfo{
        string squadName;
         squadMemberInfo[] squadMembers;
    }

    squadInfo[] public SI;
    squadMemberInfo[] public SMI;

    //Function to create a Squad/Group and name that group
        function createSquad(address[] memory _addressesToBeGrouped,string memory _squadName) public returns(string memory isCreated){
            squadInfo memory tempSquadInfo;
            squadMemberInfo memory tempSquadMemberInfo;
            tempSquadInfo.squadName = _squadName;
            tempSquadInfo.squadMembers = new squadMemberInfo[](_addressesToBeGrouped.length);
            for(uint i = 0; i < _addressesToBeGrouped.length; i++){
                tempSquadMemberInfo.memberAddress = _addressesToBeGrouped[i];
                tempSquadMemberInfo.memberName = SMI[tempSquadMemberInfo.memberAddress].memberName;
                tempSquadInfo.squadMembers[i] = tempSquadMemberInfo;
            }
            SI.push(tempSquadInfo);
            isCreated = "Squad Created";
        }
    }

    //function to add a member to a squad
    function addMemberToSquad(address _memberAddress,string memory _squadName) public returns(string memory isAdded){
        squadInfo memory tempSquadInfo;
        squadMemberInfo memory tempSquadMemberInfo;
        tempSquadInfo = SI[_squadName];
        tempSquadMemberInfo.memberAddress = _memberAddress;
        tempSquadMemberInfo.memberName = SMI[tempSquadMemberInfo.memberAddress].memberName;
        tempSquadInfo.squadMembers.push(tempSquadMemberInfo);
        SI[_squadName] = tempSquadInfo;
        isAdded = "Member Added";
    }

    //Function to create a Squadmember 
    function createSquadMember(string memory _memberName, address _memberAddress) public{
        squadMemberInfo memory SM = squadMemberInfo(_memberName, _memberAddress);
        SMI.push(SM);
    }


    //Function to remove Members from an existing Squad
    function removeMember(address _memberAddress) public returns(bool isRemoved) { 
        for(uint i = 0; i < SMI.length; i++){
            if(SMI[i].memberAddress == _memberAddress){
                SMI[i] = SMI[SMI.length-1];
                return true;
            }
        }
        return false;
    }

    //Function to add a squad to a game
    function addSquadToGame(string memory _squadName, address _gameAddress) public returns(bool isAdded){
        for(uint i = 0; i < SI.length; i++){
            if(SI[i].squadName == _squadName){
                for(uint j = 0; j < SI[i].squadMembers.length; j++){
                    if(SI[i].squadMembers[j].memberAddress == _gameAddress){
                        return false;
                    }
                }
                SI[i].squadMembers.push(squadMemberInfo(_gameAddress));
                return true;
            }
        }
        return false;
    }
    //Function to get the winner of the game
    function getWinner(uint _gameNumber) public returns(address winnerAddress){
        uint winningNumber = 0;
        uint winningIndex = 0;
        for(uint i = 0; i < SMI.length; i++){
            if(SMI[i].memberAddress == winnerAddress){
                winningNumber = winningNumber + 1;
                winningIndex = i;
            }
        }
        if(winningNumber == 1){
            return SMI[winningIndex].memberAddress;
        }
        else{
            return 0;
        }
    }

    //Function to get the Squadwinner of the game
    function getSquadWinner(uint _gameNumber) public returns(address squadWinnerAddress){
        uint winningNumber = 0;
        uint winningIndex = 0;
        for(uint i = 0; i < SI.length; i++){
            if(SI[i].squadName == squadWinnerAddress){
                winningNumber = winningNumber + 1;
                winningIndex = i;
            }
        }
        if(winningNumber == 1){
            return SI[winningIndex].squadName;
        }
        else{
            return 0;
        }
    }


}

