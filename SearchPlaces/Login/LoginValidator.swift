//
//  LoginValidator.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 7/3/23.
//

import Foundation

struct LoginValidator {
    func validateUserName(userName: String) -> Bool {
        isValidEmail(userName)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        // Regular expression pattern for a valid email address
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func validatePassWord(passWord: String) -> Bool {
        isFirstLetterCapital(input: passWord)
        && isMinChars(input: passWord)
        && isNoExtraWhiteSpaces(input: passWord)
        && isWithOneSpecialChar(input: passWord)
    }
    
    private func isFirstLetterCapital(input: String) -> Bool {
        guard let firstChar = input.first else { return false }
        let firstCharString = String(firstChar)
        return firstCharString.capitalized == firstCharString
    }
    
    private func isMinChars(input: String) -> Bool {
        input.count >= 7
    }
    
    private func isNoExtraWhiteSpaces(input: String) -> Bool {
        input.trimmingCharacters(in: .whitespaces).count == input.count
    }
    
    private func isWithOneSpecialChar(input: String) -> Bool {
        if input.range(of: "[^a-zA-Z0-9]", options:.regularExpression) != nil {
            return true
        }
        return false
    }
}
