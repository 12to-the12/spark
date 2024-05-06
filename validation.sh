#!/bin/sh

# Function to validate user input against a list of valid entries
# Arguments: $1 - User input, $2 - List of valid entries
validate_input() {
    local input="$1"
    local valid_entries="$2"

    # Check if the input is in the list of valid entries
    if echo "$valid_entries" | grep -q "\<$input\>"; then
        return 0
    else
        echo "That's not a valid option. Please enter on of the following:[ $valid_entries ]"
        return 1
    fi
}

