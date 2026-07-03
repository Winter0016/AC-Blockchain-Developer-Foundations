// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Counter {
    // Event dùng để phát ra thông điệp khi có thay đổi
    // indexed giúp chúng ta filter dữ liệu dễ hơn sau này (khi làm app)
    event Increment(address indexed user, uint256 indexed newValue);

    uint public count;

    function increment() public {
        count += 1;
        emit Increment(msg.sender, count);
    }

    function getCount() public view returns (uint) {
        return count;
    }
}
