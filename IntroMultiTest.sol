pragma solidity ^0.8.17;

contract TestContract {
    uint256 public state = 0;

    function incrementState() public {
        state += 1;
    }

    function resetState() public {
        state = 0;
    }

    // Echidna Test 1: Check if state is always less than 10
    function echidna_state_less_than_10() public view returns (bool) {
        return state < 10;
    }

    // Echidna Test 2: Check if state is always greater than or equal to 0
    function echidna_state_greater_than_0() public view returns (bool) {
        return state >= 0;
    }

    // Echidna Test 3: Check if state resets to 0
    function echidna_reset_state() public returns (bool) {
        uint256 oldState = state;
        resetState();
        bool passed = (state == 0);
        state = oldState; // Revert state
        return passed;
    }
}
