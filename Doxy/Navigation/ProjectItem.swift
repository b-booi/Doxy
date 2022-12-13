//
//  RecordListItem.swift
//  Doxy
//
//  Created by Bubele Booi on 12/12/22.
//

import SwiftUI

struct ProjectItem: View {
    
  //  @ObservedObject var projectItemVM: ProjectItemViewModel
    

    var title = ""
    var artist = ""
    var fee = 0.0
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading, content: {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(artist)
                        .font(.title3)

                }) 
               

                Spacer()
                Text(String(format: "$%.02f", fee))
                    .foregroundColor(.secondary)
                    .font(.title3)
                    
            }
            
        }
        .padding(20)
    }
}

struct ProjectItem_Previews: PreviewProvider {
    static var previews: some View {
        ProjectItem( )
    }
}
