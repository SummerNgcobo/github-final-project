#!/bin/bash

# Simple Interest Calculator
# Author: SummerNgcobo
# Description: Calculates simple interest given principal, annual rate, and time period

# Display welcome message
echo "----------------------------------------"
echo "|   SIMPLE INTEREST CALCULATOR v1.0    |"
echo "----------------------------------------"
echo

# Function to validate numeric input
validate_input() {
    local num=$1
    if ! [[ "$num" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: '$num' is not a valid number. Please enter numeric values only."
        return 1
    fi
    return 0
}

# Get principal amount with validation
while true; do
    read -p "Enter the principal amount (in Rands): " principal
    if validate_input "$principal"; then
        break
    fi
done

# Get annual interest rate with validation
while true; do
    read -p "Enter the annual interest rate (in %): " rate
    if validate_input "$rate"; then
        break
    fi
done

# Get time period with validation
while true; do
    read -p "Enter the time period (in years): " time
    if validate_input "$time"; then
        break
    fi
done

# Calculate simple interest
# Formula: SI = (Principal * Rate * Time) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Display results with formatting
echo
echo "----------------------------------------"
echo "CALCULATION RESULTS:"
echo "----------------------------------------"
printf "Principal Amount:   R%.2f\n" $principal
printf "Annual Rate:        %.2f%%\n" $rate
printf "Time Period:        %.2f years\n" $time
echo "----------------------------------------"
printf "Simple Interest:    R%.2f\n" $interest
echo "----------------------------------------"

# Calculate and display total amount
total=$(echo "scale=2; $principal + $interest" | bc)
printf "Total Amount:       R%.2f\n" $total
echo "----------------------------------------"
