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
    function createSquad(string memory _squadName) public{
        squadInfo memory S = squadInfo(_squadName, SMI);
        SI.push(S);
    }

    //Function to add Members to an existing Squad
    function addMember(string memory _squadName,address _memberAddress, string memory _memberName) public returns(bool isAdded){
        squadMemberInfo memory squadMember = squadMemberInfo(_memberName,_memberAddress);
        SMI.push(squadMember);
        squadInfo memory squadInformation = squadInfo(_squadName,SMI);
        SI.push(squadInformation);
        return true;
    }

    //Function to remove Members from an existing Squad
    function removeMember(string memory _squadName,address _memberAddress) public returns(bool isRemoved) { 
        for(uint i = 0; i < SMI.length; i++){
            if(SMI[i].memberAddress == _memberAddress){
                SMI[i] = SMI[SMI.length-1];
                return true;
            }
        }
        return false;
    }
    //Function to get the Squad Name of a particular address
    function getSquadName(address _memberAddress) public returns(string memory squadName){
        for(uint i = 0; i < SMI.length; i++){
            if(SMI[i].memberAddress == _memberAddress){
                squadName = SI[i].squadName;
                return squadName;
            }
        }
        return "";
    }
          //Function to add a squad 
    function addSquad(string memory _squadName, squadMemberInfo[] memory _squadMembers) public returns(bool isAdded){
        
        squadInfo memory squadInformation = squadInfo(_squadName,_squadMembers);
        SI.push(squadInformation);
        return true;
    }

    //Function to remove a squad


}

