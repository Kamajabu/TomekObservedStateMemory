//
//  ObjectForObserving.swift
//  TomekMemory
//
//  Created by Kamil Buczel on 10/05/2022.
//

import Foundation
import SwiftUI

class ObservableObjectExample: ObservableObject {
    @Published var publishedString = ""
    
    init() {
        print("DEBUG - created ObjectForObserving")
    }
}

