# New2Fuzzing

Beginners guide and basic introduction to Fuzzing, specifically Echidna.

# Property Testing

Remember, Echidna tests should not have any arguments and should return a boolean indicating whether the test passed. 
If a test returns false, Echidna will consider it a failure.
The goal of property testing with Echidna is to ensure your contract behaves as expected under all possible states. 
It’s not necessarily about making all tests pass, but about understanding why they fail and whether that indicates a problem with your contract.


# Install guide

Clone this repo into your file of choice ( preferably your smart contract test folder ).

Make sure you have Echidna installed, if not it is very simple and you can find multiple tutorials online.

# How to run tests

In the contract, echidna_state_less_than_10 and echidna_state_greater_than_0 are property tests that check if the state variable is always less than 10 and greater than or equal to 0, respectively. echidna_reset_state is a stateful test that checks if the resetState function correctly resets the state variable to 0.


To run these tests with Echidna, you would use the following command in the correct repository:

echidna-test IntroMultiTest.sol

This command tells Echidna to run all tests in the TestContract.sol file. Echidna will automatically find all functions that start with echidna_ and run them as tests.

# Test outcomes

The echidna_state_less_than_10 test is designed to fail if the state variable in the contract ever reaches 10 or more. Your call sequence output should look like the incrementState function was called 10 times, which would set state to 10. Since 10 is not less than 10, the echidna_state_less_than_10 test should correctly fail.

This is the whole point of the introduction! If you get this output it means that Echidna is correctly identifying when the contract’s state violates the properties defined. In this case, it’s showing that it’s possible for state to reach 10 if incrementState is called 10 times.

If you wanted the test to pass, you could experiment and modify the contract (sudo nano 'contractName' for ziion OS) or your property test. For example, you could add a condition in the incrementState function to prevent state from exceeding 9. Alternatively, you could change the echidna_state_less_than_10 test to check if state is less than or equal to 10.

Any help? Feel free to reach out. 

# BONUS Stateful/Stateless

A stateful test is a type of property test that maintains the state of the contract between each function call. 
This is in contrast to a stateless test, where Echidna discards state changes during fuzzing.

Stateful tests are useful for checking properties that involve multiple function calls or depend on the contract’s state. 
For example, you might use a stateful test to check if a certain function can only be called after another function has been called, or if a function behaves differently depending on the contract’s state.

Finally a statless test is a type of property test where any state changes are discarded during the fuzzing process. 







