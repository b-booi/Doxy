//
//  MatchView.swift
//  Doxy
//
//  Created by Bubele Booi on 12/12/22.
//

import SwiftUI

struct MatchView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                 VStack {
                     Spacer()
                     VStack(alignment: .leading, spacing: 8.0) {
                         Image("gold_record")
                             .resizable(resizingMode: .stretch)
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 30.0, height: 30.0)
                             .cornerRadius(40)
                             .background(.ultraThickMaterial, in :RoundedRectangle(cornerRadius: 30, style: .continuous))
                             .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 4)
                             .matchedGeometryEffect(id: "record", in: namespace)
                         Text("Records")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.5), .primary], startPoint: .topLeading, endPoint: .bottomTrailing))

                            .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth:.infinity, alignment: .leading)
                         Text("Review confirmed records, pending negotiations and fees cleared ")
                             .multilineTextAlignment(.leading)
                             .lineLimit(2)
                             .frame(maxWidth: .infinity, alignment: .leading)
                             .foregroundColor(.secondary)
                             .matchedGeometryEffect(id: "subtitle", in: namespace)
                     }
                     .background(
                         Rectangle()
                             .fill(.ultraThickMaterial)
                             .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                             .blur(radius: 30)
                             .matchedGeometryEffect(id: "blur", in: namespace)
                             
                         
                     )
                     
                   
                }
                .padding(.all, 20.0)
                .frame(height: 350.0)
                .foregroundColor(.white)
                
                .background(
                    .ultraThinMaterial
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace))
                .background(
                    Image("Blob 1").offset(x: 250, y:-100)
                        .matchedGeometryEffect(id: "blob", in: namespace))
                
                .overlay(
                    Image("Mic_Pic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:450)
                        .offset(x: 32, y: -80)
                        .matchedGeometryEffect(id: "image", in: namespace)
                )
                .padding(20)
              
            }else {
                
                ScrollView {
                    VStack {
                        Spacer()
                        Image("gold_record")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300.0, height: 300.0)
                            .cornerRadius(10)
                            .background(.ultraThickMaterial, in :Circle())
                            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 4)
                            .offset(y:30)
                            .matchedGeometryEffect(id: "record", in: namespace)
                        
                       
                    }
                    .frame(maxWidth: .infinity)
                    
                    .padding(.all, 20.0)
                    .frame(height: 350.0)
                    .foregroundColor(.black)
                    .background(
                        .ultraThinMaterial
                    )
                  
                    
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: namespace))
                    .overlay(content: {
                        VStack(alignment: .leading, spacing: 8.0){
                           
                            Text("Records")
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.5), .primary], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .matchedGeometryEffect(id: "title", in: namespace)
                            .frame(maxWidth:.infinity, alignment: .leading)

                            Text("Review confirmed records, pending negotiations and fees cleared ")
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.secondary)
                                .matchedGeometryEffect(id: "subtitle", in: namespace)
                            Divider()
                    
                            
                            
                        }
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.white)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "blur", in: namespace)
                            
                        )
                        .offset(y: 120)
                    })
                    .background(
                        Image("Blob 1").offset(x: 250, y:-100)
                            .matchedGeometryEffect(id: "blob", in: namespace))
                    
                    
                    .overlay(
                        Image("Mic_Pic")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:400)
                            .offset(x: 32, y: -80)
                            .opacity(0)
                            .matchedGeometryEffect(id: "image", in: namespace)
                )
                }
                
            }
              
           
        }
        .onTapGesture {
            withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                show.toggle()
            }
            
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
