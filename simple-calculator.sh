#!/usr/bin/env bash

OPERATION_REGEX='^([-0-9 ].?[0-9]?)+ [-,+,*,/,^] ([-0-9].?[0-9]?)+$'

save_to_file() {
    echo "$1" >> operation_history.txt
}

check_operation_validity() {
    if [[ "$1" =~ $OPERATION_REGEX ]]; then
        result=$(echo "scale=2; ${1}" | bc -l)
        printf "%s\n" "$result"
        printed_result=$(printf "%s\n" "$result")
        save_to_file "$printed_result"
    else
        echo "Operation check failed!"
        save_to_file "Operation check failed!"
    fi
}

echo "Welcome to the basic calculator!"
save_to_file "Welcome to the basic calculator!"
while :
do
    echo "Enter an arithmetic operation or type 'quit' to quit:"
    save_to_file "Enter an arithmetic operation or type 'quit' to quit:"
    read -r operation
    save_to_file "$operation"
    if [[ "$operation" == "quit" ]]; then
        echo "Goodbye!"
        save_to_file "Goodbye!"
        break
    else
        check_operation_validity "$operation"
    fi
done

