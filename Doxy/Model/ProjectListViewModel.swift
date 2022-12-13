//
//  ProjectListViewModel.swift
//  Doxy
//
//  Created by Bubele Booi on 12/13/22.
//

import Foundation
import Combine

//Test data imported here
class ProjectListViewModel: ObservableObject {
   
    @Published var projectItemViewModels = [ProjectItemViewModel]()
    
    init(){
        self.projectItemViewModels = testDataProjects.map({ project in
            ProjectItemViewModel(project: project)
        })
    }
}
