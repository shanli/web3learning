// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 声明一个智能合约
contract SimpleVoting {
    // 声明候选人结构体
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // 使用数组存储候选人列表
    Candidate[] public candidates;

    // 用于存储每个地址的投票记录
    mapping(address => bool) public voters;

    // 添加候选人
    function addCandidate(string memory _name) public {
        // // 检查调用者是否已投票
        // require(!voters[msg.sender], "You can only add one candidate.");

        uint256 candidateId = candidates.length;
        candidates.push(Candidate(candidateId, _name, 0));
        // voters[msg.sender] = true;
    }

    // 进行投票
    function vote(uint256 _candidateId) public {
        // 检查调用者是否已投票
        require(!voters[msg.sender], "You can only vote once.");

        // 检查候选人是否存在
        require(_candidateId < candidates.length, "Candidate does not exist.");

        // 增加候选人的得票数
        candidates[_candidateId].voteCount++;

        // 标记调用者已投票
        voters[msg.sender] = true;
    }

    // 查询候选人的得票数
    function getVotes(uint256 _candidateId) public view returns (uint256) {
        require(_candidateId < candidates.length, "Candidate does not exist.");
        return candidates[_candidateId].voteCount;
    }
}