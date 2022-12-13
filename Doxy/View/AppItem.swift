//
//  AppItem.swift
//  Doxy
//
//  Created by Bubele Booi on 12/12/22.
//

import SwiftUI

struct AppItem: View {
    var namespace : Namespace.ID
    @Binding var show : Bool
    
    var body: some View {
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
       .padding(20)    }
}

struct AppItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        AppItem( namespace: namespace, show: .constant(true))
    }
}
