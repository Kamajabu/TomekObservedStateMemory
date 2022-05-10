//
//  ViewController.swift
//  TomekMemory
//
//  Created by Kamil Buczel on 10/05/2022.
//

import Foundation
import UIKit
import SwiftUI

class HoistingViewController: UIViewController {
    var viewHoldingObjectForObserving: ViewHoldingObjectForObserving?
    
    var objectForObserving: ObservableObjectExample? = ObservableObjectExample()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewHoldingObjectForObserving = ViewHoldingObjectForObserving(objectForObserving: self.objectForObserving!)
        
        let host = UIHostingController(rootView: ParentWrapper(objectForObserving: self.objectForObserving!))
        
        let button = UIButton()
        button.setTitle("clearObjectForObserving", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(clearObjectForObserving), for: .touchUpInside)
        
        let button2 = UIButton()
        button2.setTitle("copy viewHoldingObjectForObserving", for: .normal)
        button2.setTitleColor(.black, for: .normal)
        button2.addTarget(self, action: #selector(tapped2), for: .touchUpInside)
        
        addChild(host)
        let stackView = UIStackView(arrangedSubviews: [button, button2, host.view])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    @objc func clearObjectForObserving() {
        objectForObserving = nil
        // weakObjectForObserving is retained by ViewHoldingObjectForObserving
        print("DEBUG - weakObjectForObserving is: \(String(describing: objectForObserving))")
    }
    
    @objc func tapped2() {
        // copying struct as usual copies all its properties hence objectForObserving instance is preserved, not recreated
        let viewHoldingObjectForObservingCopy = viewHoldingObjectForObserving
        viewHoldingObjectForObserving = viewHoldingObjectForObservingCopy
    }
    
}
