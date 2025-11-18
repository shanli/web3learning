// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract Voting{
    struct Candidate{
        uint256 voteCount;
        string name;
    }
    Candidate[] public cands;
    // 投票者记录
    mapping(address => bool) public voters;
    // 投票结果
    mapping (uint256 => Candidate) public results;
    // 添加候选人并初始化得票数为0
    // ["jack","david","lucy","mary"]
    function addProposals(string[] memory _names) public  {
        for(uint256 i = 0; i < _names.length; i++) {
            results[cands.length].name = _names[i];
            results[cands.length].voteCount = 0;
            // cands.push({_name, });
            cands.push(Candidate({
                    name: _names[i],
                    voteCount: 0
            }));
        }
    }
    function vote(uint256 _candidateId) public  {
        require(!voters[msg.sender], 'you have ready voted!');
        results[_candidateId].voteCount++;
        // 标记调用者已投票
        voters[msg.sender] = true;
    }
    function getVotes(uint256 _candId) public view returns(uint256) {
        return results[_candId].voteCount;
    }
    function resetVotes() public returns(Candidate[] memory){
        for (uint256 i = 0; i < cands.length; i++) {
            results[i].voteCount = 0;
            cands[i].voteCount = 0;
        }
        return cands;
    }
    function getVotes() public view returns(Candidate[] memory){
        Candidate[] memory allCandidates = new Candidate[](cands.length);
        for (uint256 i = 0; i < cands.length; i++) {
            allCandidates[i] = results[i];
        }
            return allCandidates;
    }
}