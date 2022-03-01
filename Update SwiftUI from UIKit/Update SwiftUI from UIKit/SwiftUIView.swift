//
//  SwiftUIView.swift
//  Update SwiftUI from UIKit
//
//  Created by Maysam Shahsavari on 2022-02-28.
//

import SwiftUI

protocol SwiftUIViewDelegate {
    func buttonClicked()
}

class SharedViewControllerState: ObservableObject {
    @Published var isLoading: Bool = false
}

struct SwiftUIView: View {
    var delegate: SwiftUIViewDelegate?
    
    @ObservedObject private var state: SharedViewControllerState
    
    init(state: SharedState) {
        self.state = state
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Button("Button 1") {
                        state.isLoading = true
                        delegate?.buttonClicked()
                    }
                }.disabled(state.isLoading)
                
                Section {
                    Text("Click here to enabled the above button")
                    Button("Click") {
                        setIsActionCalled(value: false)
                    }
                }
            }
            
        }
    }
    
    func setIsActionCalled(value: Bool) {
        state.isLoading = value
    }
}
