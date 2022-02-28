//
//  ViewController.swift
//  Update SwiftUI from UIKit
//
//  Created by Maysam Shahsavari on 2022-02-28.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var swiftUIView = SwiftUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swiftUIView.delegate = self

        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
    
    
}

// MARK: - SwiftUIView Delegate
extension ViewController: SwiftUIViewDelegate {
    func buttonClicked() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.swiftUIView.setIsActionCalled(value: false)
        }
    }
    
    
}
