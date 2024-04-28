//
//  KeyChainVC.swift
//  lecture22
//
//  Created by MacBook Pro on 27.04.24.
//

import Foundation

class KeyChainVC {
    
    enum KeyChainError: Error {
        case sameItemFound
        case unknown
        case nosuchDataFound
        case KCErrorWithCode(Int)
    }
    //    MARK: - Save and Get functions
    
    static func save(service: String, account: String, password: Data) throws {
        let query: [String: AnyObject] = [
            kSecClass as String        : kSecClassGenericPassword,
            kSecAttrService as String  : service as AnyObject,
            kSecAttrAccount as String  : account as AnyObject,
            kSecValueData as String    : password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }
        
        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }
        
        print("Saved successfully")
        
    }
    
    static func get(service: String, account: String) -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String        : kSecClassGenericPassword,
            kSecAttrService as String  : service as AnyObject,
            kSecAttrAccount as String  : account as AnyObject,
            kSecReturnData as String   : kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String   : kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else {
            return nil
        }
        
        return result as? Data
    }
    //    MARK: - Boolean and Delete function
    
    static func credentialsAreSaved() -> Bool {
        return get(service: "CountryApp", account: "username") != nil &&
        get(service: "CountryApp", account: "password") != nil
    }
    
    func delete(service: String, account: String) throws {
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess else {
            throw KeyChainError.KCErrorWithCode(Int(status))
        }
    }
}
