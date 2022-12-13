//
//  TabBar.swift
//  Doxy
//
//  Created by Bubele Booi on 12/11/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AwardsView()
                .tabItem {
                    Image(systemName: "medal")
                    Text("Awards")
                }
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }
       
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
