//
//  PMUser.swift
//  property_management_app
//
//  Created by Tony Forsythe on 11/3/17.
//  Copyright © 2017 Tony Forsythe. All rights reserved.
//

import Foundation


enum PMUserKeys : String {
    case ID = "id"
    case firstName = "firstName"
    case lastName = "lastName"
    case email = "email"
    case profileImage = "profileImage"
    case profileImageThumb = "profileImageThumbnail"
    case password = "password"
}

struct PMUser {
    
    var userID : Int!
    var firstName : String!
    var lastName : String!
    var email : String!
    var profileImage : String!
    var profileImageThumb : String!
    var password : String!
    
    
    static func buildUserWithDict( jsonDict : [String : Any] ) -> PMUser {
        
        var newUser = PMUser()
        
        
        newUser.firstName = PMUser.getStringValueForKey(dict: jsonDict, key: .firstName)
        newUser.lastName = PMUser.getStringValueForKey(dict: jsonDict, key: .lastName)
        newUser.email = PMUser.getStringValueForKey(dict: jsonDict, key: .email)
        newUser.profileImage = PMUser.getStringValueForKey(dict: jsonDict, key: .profileImage)
        newUser.profileImageThumb = PMUser.getStringValueForKey(dict: jsonDict, key: .profileImageThumb)
        newUser.password = PMUser.getStringValueForKey(dict: jsonDict, key: .password)
        newUser.userID = PMUser.getIntValueForKey(dict: jsonDict, key: .ID)
        
        
        return newUser
        
    }
    
    private static func getIntValueForKey(dict : [String : Any], key : PMUserKeys) -> Int {
        return dict[key.rawValue] as? Int ?? 0
    }
    private static func getStringValueForKey( dict : [String : Any ], key : PMUserKeys) -> String {
        
        return dict[key.rawValue] as? String ?? ""
    }
}


