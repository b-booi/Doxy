//
//  Records.swift
//  Doxy
//
//  Created by Bubele Booi on 12/11/22.
//

import SwiftUI

struct Records: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("gold_record")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30.0, height: 30.0)
                .cornerRadius(40)
                .background(.ultraThickMaterial, in :RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 4)
            
            Text("Records")
                .fontWeight(.bold)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.5), .primary], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("Review confirmed records, pending negotiations and fees cleared ")
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .frame(height: 350.0)
        .background(
            .ultraThinMaterial
          
        )
        .cornerRadius(30.0)
        .mask(RoundedRectangle(cornerRadius: 30, style:.continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .padding(.horizontal, 20)
        .background(
            Image("Blob 1").offset(x: 250, y: -100))
        .overlay {
            Image("Mic_Pic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:450)
                .offset(x: 32, y: -80)
        }
        

    }
}

struct Records_Previews: PreviewProvider {
    static var previews: some View {
        Records()
    }
}
