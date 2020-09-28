//
//  User.swift
//  playflix
//
//  Created by Paola Pagotto on 28/09/2020.
//  Copyright © 2020 Paola Pagotto. All rights reserved.
//

import Foundation
import UIKit


class User {
    var email: String
    var password: String
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}
