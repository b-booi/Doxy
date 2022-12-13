//
//  ProjectItemViewModel.swift
//  Doxy
//
//  Created by Bubele Booi on 12/13/22.
//

import Foundation
import Combine
class ProjectItemViewModel: ObservableObject, Identifiable {
    @Published var project : Project
    private var cancellables = Set<AnyCancellable>()
    var id = ""
    @Published var paid = false
    
    init(project: Project){
        self.project = project
        
        $project
            .map{ project in
                project.id
                
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
