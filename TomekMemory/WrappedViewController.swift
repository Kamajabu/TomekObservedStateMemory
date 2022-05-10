//
//  WrappedViewController.swift
//  TomekMemory
//
//  Created by Kamil Buczel on 10/05/2022.
//

import Foundation
import SwiftUI
import UIKit

struct ViewControllerWrapped: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return HoistingViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    
    typealias UIViewControllerType = UIViewController

}
