//
//  ParentWrapper.swift
//  TomekMemory
//
//  Created by Kamil Buczel on 10/05/2022.
//

import SwiftUI

// Used to perform redraws of ViewHoldingObjectForObserving without removing it from View hierarchy
struct ParentWrapper: View {
    @State var tapped = false
    
    
    // TODO: SWAP THIS
    
//    @ObservedObject var objectForObserving: ObservableObjectExample
    @StateObject var objectForObserving: ObservableObjectExample

    var body: some View {
        Button("Redraw ViewHoldingObjectForObserving") {
            tapped.toggle()
        }.background(
            tapped ? Color.red : Color.blue
        ).foregroundColor(.yellow)
        
        // If ViewHoldingObjectForObserving uses StateObject, then objectForObserving is retained in between redraws
        // Otherwise if ViewHoldingObjectForObserving ObservedObject, then objectForObserving is recreated on each redraw
        ViewHoldingObjectForObserving(objectForObserving: objectForObserving)
        
    }
}
