// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract BinarySearch {
    // 二分查找实现
    function binarySearch(uint256[] memory arr, uint256 target) public pure returns (int256) {
        require(isSorted(arr), "Array must be sorted");
        uint256 left = 0;
        uint256 right = arr.length;
        
        while (left < right) {
            uint256 mid = left + (right - left) / 2;
            
            if (arr[mid] == target) {
                return int256(mid); // 找到目标，返回索引
            } else if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        return -1; // 未找到目标
    }
    
    // 验证数组是否有序
    function isSorted(uint256[] memory arr) public pure returns (bool) {
        for (uint256 i = 1; i < arr.length; i++) {
            if (arr[i] < arr[i - 1]) {
                return false;
            }
        }
        return true;
    }
}