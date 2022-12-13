//
//  RecordsView.swift
//  Doxy
//
//  Created by Bubele Booi on 12/12/22.
//

import SwiftUI

struct RecordsView: View {
    @ObservedObject var projectListVM = ProjectListViewModel()
    @StateObject private var viewModel = ProjectViewModel()
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    @State var apear = [false, false, false]
    let projects = testDataProjects
    var totalConfrimedFees = 0.0
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                MoneyOverview
                    .offset(y: -30)
                RecordsOverview
                    .offset(y: -90)
                    .padding(.bottom, 30)
          
            }
            // .background(Color("Background"))
            .ignoresSafeArea()
            
            button
           
        }
        .onAppear{
            withAnimation(.easeOut.delay(0.3)) {
                apear[0] = true
            }
            withAnimation(.easeOut.delay(0.5)) {
                apear[1] = true
            }
            
            apear[2] = true
        }
        .onChange(of: show) { newValue in
            apear[1] = false
            apear[0] = false
            apear[2] = false

        }
    }
    var cover: some View {
        VStack {
            Spacer()
            Image("gold_record")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
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
                
                
                
                
                
                
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "blur", in: namespace)
                
            )
            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 4)
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
    var button: some View {
        Button{
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .offset(x: -10, y:30)
        .padding(20)
        .ignoresSafeArea()
    }
    var RecordsOverview: some View {
        
        VStack(alignment: .leading){
           Text("Completed Projects")
                .fontWeight(.bold)
                .font(.title)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.linearGradient(colors: [.primary.opacity(0.5), .primary], startPoint: .topLeading, endPoint: .bottomTrailing))
                .padding(.horizontal, 30)
//            List(projectListVM.projectItemViewModels) { projectItemVM in
//                ProjectItem(projectItemVM: projectItemVM, title: projectItemVM.project.Title, artist: projectItemVM.project.Artist, fee: projectItemVM.project.fee)
//                    .frame(maxHeight: 80)
//
//            }
//            .mask(RoundedRectangle(cornerRadius: 30, style:.continuous))
//            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
//            .frame(maxWidth: .infinity)
//            .frame(height: 280)
//            .scrollContentBackground(.hidden)
            if !viewModel.listObject.isEmpty {
                VStack {
                    ForEach(viewModel.listObject ) { object in
                        VStack {
                            Text(String(object.ID))
                            Text(object.Song)
                        }
                       
                    }
                }
            }
            Button {
                viewModel.observeListOject()
            }label: {
                Text( "Read")
            }
            
            
        }
        
    }
    var MoneyOverview: some View {
        ZStack {
            ZStack {
                VStack(alignment: .center){
                    
                    Text(getTotalClearedFees(projects:projects))
                        .font(.title)
                        .fontWeight(.bold)
                    //Text("\(String(format: "$%.02f", getTotalOutstandingFees(projects: projects)))"+" \npending")
                    Text(getTotalOutstandingFees(projects:projects))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    Text("Outstanding")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                CircularView(paidValue: getProgressPosition(projects: projects), pendingValue: getPendingPosition(projects: projects), appear: $show)
                    .frame(maxWidth: 220)
//                CircularView(value: getProgressPosition(projects: projects, pendingValue: 0.7, appear: $show)
//
                    
            }
   
        }
        .frame(maxWidth: .infinity)
        .frame(height: 400)
    }
}

struct RecordsView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        RecordsView(namespace: namespace, show: .constant(true))
    }
}

func getTotalClearedFees(projects: [Project]) -> String {
    var totalClearedFees = 0.0
    let nf = NumberFormatter()
    nf.maximumFractionDigits = 0
    nf.numberStyle = .currency
    for project in projects {
        if(project.Paid){
            totalClearedFees += project.fee
        }
        
    }
    let totalClearedFeesString = nf.string(from: totalClearedFees as NSNumber)
    return totalClearedFeesString ?? ""
  
}

func getTotalOutstandingFees(projects: [Project]) -> String {
    var totalOutstandingFees = 0.0
    let nf = NumberFormatter()
    nf.maximumFractionDigits = 0
    nf.numberStyle = .currency
   
    for project in projects {
        if(!project.Paid){
            totalOutstandingFees += project.fee
        }
        
    }
    let totalOutstandingFeesString = nf.string(from: totalOutstandingFees as NSNumber)
    
    return totalOutstandingFeesString ?? ""
  
}

func getProgressPosition (projects: [Project]) -> Double {
    var paidProgress = 0.0
    var sum = 0.0
    for project in projects {
        if (project.Paid){
            sum += project.fee
        }
        paidProgress = sum/72000
    }
    return paidProgress
}

func getPendingPosition (projects: [Project]) -> Double {
    var pendingProgress = 0.0
    var sum = 0.0
    for project in projects {
        sum += project.fee
        
    }
    pendingProgress = sum/72000
    return pendingProgress
}
    

