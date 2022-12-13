//
//  CircularView.swift
//  Doxy
//
//  Created by Bubele Booi on 12/12/22.
//

import SwiftUI

struct CircularView: View {
    var paidValue: CGFloat = 0.0
    var pendingValue: CGFloat = 0.4
    @Binding var appear : Bool
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .fill(.angularGradient(colors: [.white], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                .rotationEffect(.degrees(270))
                .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            Circle()
                .trim(from: 0, to: appear ? pendingValue : 0)
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .fill(.angularGradient(colors: [.gray.opacity(0.17)], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                .rotationEffect(.degrees(270))
                .onAppear {
                    withAnimation(.spring().delay(0.5)) {
                        appear = true
                    }
                }
                .onDisappear{
                    appear = false
            }
            Circle()
                .trim(from: 0, to: appear ? paidValue : 0)
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .fill(.angularGradient(colors: [.purple, .pink, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                .rotationEffect(.degrees(270))
                .onAppear {
                    withAnimation(.spring().delay(0.5)) {
                        appear = true
                    }
                }
                .onDisappear{
                    appear = false
            }

            
        }
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView( appear: .constant(true))
    }
}
