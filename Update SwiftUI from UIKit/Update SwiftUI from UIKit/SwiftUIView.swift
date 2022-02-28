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

class ObservableAction: ObservableObject {
    @Published var isLoading: Bool = false
}

struct SwiftUIView: View {
    var delegate: SwiftUIViewDelegate?
    
    @ObservedObject private var observableBool = ObservableAction()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Button("Button 1") {
                        observableBool.isLoading = true
                        delegate?.buttonClicked()
                    }
                }.disabled(observableBool.isLoading)
                
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
        observableBool.isLoading = value
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
