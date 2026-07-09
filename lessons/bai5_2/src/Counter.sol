// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Counter {
    // Event dùng để phát ra thông điệp khi có thay đổi
    // indexed giúp chúng ta filter dữ liệu dễ hơn sau này (khi làm app)
    event Increment(address indexed user, uint256 newValue, uint256 oldValue);

    uint public count;

    function increment() public {
        count += 1;
        emit Increment(msg.sender, count, count - 1);
    }

    function getCount() public view returns (uint) {
        return count;
    }
}
