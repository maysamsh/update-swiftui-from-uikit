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

struct SwiftUIView: View {
    var delegate: SwiftUIViewDelegate?
    
    @State private var isActionCalled = false
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Button("Button 1") {
                        isActionCalled = true
                        delegate?.buttonClicked()
                    }
                }.disabled(isActionCalled)
                
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
        isActionCalled = value
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
