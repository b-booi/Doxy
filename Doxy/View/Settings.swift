//
//  Settings.swift
//  Doxy
//
//  Created by Bubele Booi on 12/11/22.
//

import SwiftUI
import Firebase
import AuthenticationServices

struct Settings: View {
    
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Placeholder")
                
                VStack(spacing: 20) {
                    Text("logged in successfully!")
                    
                    Button("Log out") {
                        DispatchQueue.global(qos: .background).async {
                            try? Auth.auth().signOut()
                        }
                        withAnimation(.easeInOut){
                            log_Status = false
                        }
                    }
                    .fontWeight(.semibold)

                }
                .navigationTitle("Settings")
                
               
            }
            
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
