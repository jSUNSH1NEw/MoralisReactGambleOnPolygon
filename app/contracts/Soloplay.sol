// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Solo{
    struct playerInfos{
        string memberName;
        address memberAddress;
        uint memberBalance;
        uint256 betToday;
    }
    struct BetInfos{
        uint256 betAmount;
        uint256 betNumber;
        uint256 betTime;
    }
    playerInfos[] public SMI;
}