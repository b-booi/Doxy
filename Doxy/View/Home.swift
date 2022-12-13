//
//  Home.swift
//  Terminal
//
//  Created by Bubele Booi on 12/10/22.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @AppStorage("log_status") var log_Status = false
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    
    var body: some View {
    
        
        ZStack {
          

            ScrollView{
               scrollDetection
                
                if !show {
                    AppItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation (.openCard){
                                show.toggle()
                                showStatusBar = false
                            }
                            
                        }
                    
                }
             
               
                
               
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
                withAnimation(.easeInOut) {
                    if value  < 0 {
                        hasScrolled = true
                    }else {
                        hasScrolled = false
                    }
                }
               
            })
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })        .overlay {
                if !show {
                    NavigationBar(title: "Home", hasScrolled: $hasScrolled)
                }
              
                   
        }
            if show {
                RecordsView(namespace: namespace, show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            
                
            }
           
        }
        .statusBarHidden(showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = true
                }
                else {
                    showStatusBar = false
                }
            }
           
            
                
        }
       
       
    }
    
    var scrollDetection: some View {
        GeometryReader{ proxy in
            //Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            
        }
        .frame(height: 0)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
