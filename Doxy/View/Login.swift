//
//  Login.swift
//  Terminal
//
//  Created by Bubele Booi on 12/10/22.
//

import SwiftUI

struct Login: View {
    
    
    
    var body: some View {
        ZStack {
            Image("Background 9").ignoresSafeArea()
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()
            SignInView()
                .frame(width: 350, height: 500)
                .padding(20)
            
        }.safeAreaInset(edge: .bottom, spacing: 0) {
            Color.clear.frame(height: 44)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
