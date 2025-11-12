
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract Merge{
    function merge(uint256[] memory arr1, uint256[] memory arr2) public pure returns (uint256[] memory) {
        uint256 arr1Len = arr1.length;
        uint256 arr2Len = arr2.length;
        uint256[] memory merged = new uint256[](arr1Len + arr2Len);
        uint256 i = 0; // arr1 的指针
        uint256 j = 0; // arr2 的指针
        uint256 k = 0; // merged 的指针
        
        // 合并两个数组
        while (i < arr1Len && j < arr2Len) {
            if (arr1[i] <= arr2[j]) {
                merged[k] = arr1[i];
                i++;
            } else {
                merged[k] = arr2[j];
                j++;
            }
            k++;
        }
        
        // 复制 arr1 剩余元素
        while (i < arr1Len) {
            merged[k] = arr1[i];
            i++;
            k++;
        }
        
        // 复制 arr2 剩余元素
        while (j < arr2Len) {
            merged[k] = arr2[j];
            j++;
            k++;
        }
        
        return merged;
    }
}