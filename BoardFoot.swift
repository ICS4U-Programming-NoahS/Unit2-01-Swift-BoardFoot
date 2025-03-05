//
// BoardFoot.swift
//
// Created by Noah Smith
// Created on 2025-03-04
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The BoardFoot program gets the width and the height from the user.
// It calculates the length, so that the result is exactly 1 board foot.
// It returns the board foot value, then rounds to 2 decimal places.

// Import foundation library
import Foundation

// Declare constant, in inches cubed
let boardFootVolume = 144.0

// Define the different possible error types
enum InputError: Error {
    case invalidInput
}

func calculateBoardFoot(width: Double, height: Double) -> Double {
    // Calculate the length
    let length = boardFootVolume / (width * height)

    return length
}

// Greet the user
print("Welcome to the board foot program!")

// Initialize width and height
let width = 0.0
let height = 0.0


// do while loop to give user another chance to enter valid input
repeat {

    // Get width from user
    print("Enter the width in inches: ");

    // catch invalid width
    do {
        if let widthString = readLine(), let width = Double(widthString) {
            // Make sure width is positive
            if width <= 0 {
                // If width is not positive
                print(width, " is not a valid width. Try again.")
            } else {
                // Get height from user
                print("Enter the height in inches: ")

                // catch invalid height
                do {
                    if let heightString = readLine(), let height = Double(heightString) {
                        // Make sure height is positive
                        if height <= 0 {
                            // If height is not positive
                            print(height, " is not a valid height. Try again.")
                        } else {
                            // Call calculateLength function
                            let length = calculateBoardFoot(width: width, height: height)

                            // Display length rounded to 2 decimal places
                            print("The length is", String(format: "%.2f", length), "inches.")

                            // Break from loop
                            break
                        }
                    // If user does not enter a number
                    } else {
                        throw InputError.invalidInput
                    }
                // catch invalid height
                } catch InputError.invalidInput {
                    // If user does not enter a number
                    print("Please enter a number.")
                }
            }
        } else {
            // If user does not enter a number
            throw InputError.invalidInput
        }
    // catch invalid width
    } catch InputError.invalidInput {
        // If user does not enter a number
        print("Please enter a number.")
    }
// End of do while loop
} while width <= 0 || height <= 0
