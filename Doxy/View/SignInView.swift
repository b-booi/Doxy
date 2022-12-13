//
//  SignInView.swift
//  Terminal
//
//  Created by Bubele Booi on 12/10/22.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Doxy")
                .font(.largeTitle).bold()
            Text("because creatives suck with admin")
                .frame(maxWidth: .infinity)
                .frame(height: 50, alignment: .top)
            SignInWithAppleButton { (request) in
                loginData.nonce = randomNonceString()
                request.requestedScopes = [.email,. fullName]
                request.nonce = sha256(loginData.nonce)
            } onCompletion: { (result) in
                switch result {
                case.success(let user):
                   print("success") // do loging with Firebase
                    guard let credential = user.credential as? ASAuthorizationAppleIDCredential else{
                        print("effor with firebase")
                        return
                    }
                    loginData.authenticate(credential: credential)
                    
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
            .signInWithAppleButtonStyle(.white)
            .frame(height: 50)
            .clipShape(Capsule())
            .padding(.horizontal, 30)

        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .shadow(radius: 20)
        .background(
            Image("Blob 1").offset(x:  200, y: -100)
        )
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
