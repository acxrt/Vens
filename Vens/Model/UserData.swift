//
//  UserData.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class UserData: ObservableObject {
    
    @Published var showOpenShopsOnly = false
    @Published var shops = shopData
    
}
