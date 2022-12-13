//
//  ContentView.swift
//
//  ContentView.swift
//  Terminal
//
//  Created by Bubele Booi on 12/10/22.
//

import SwiftUI

//https://doxy-6d7bf-default-rtdb.firebaseio.com/

struct ContentView: View {
    
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        ZStack {
            if log_Status{
                TabBar()
            }else {
                //Login()
                TabBar()
            }
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
