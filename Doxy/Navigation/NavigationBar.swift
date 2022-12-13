//
//  NavigationBar.swift
//  Doxy
//
//  Created by Bubele Booi on 12/12/22.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasScrolled: Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
                .offset(y: hasScrolled ? -8 : 0)
            
            Text(title)
                .animatableFont(size: hasScrolled ? 26 : 34 , weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, hasScrolled ? 10 :20)
        }
        .frame(height:hasScrolled ? 44 : 70)
        .frame(maxHeight:.infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Title", hasScrolled: .constant(false))
    }
}
