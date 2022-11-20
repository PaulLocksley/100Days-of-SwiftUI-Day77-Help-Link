//
//  ContentViewModel.swift
//  Challenge3
//
//  Created by paul locksley on 22/10/2022.
//

import Foundation
import UIKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject   {
     
       @Published  var addingPerson: Bool
        @Published private(set) var people: [Person]
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("PeopleList")
        init() {
            self.addingPerson = false
            do {
                let data = try Data(contentsOf: savePath)
                people = try JSONDecoder().decode([Person].self, from: data)
            }catch{
                people = []
                print("Unable to load")
            }
        }
        
        
        func AddPerson(){
            addingPerson = true
        }
        
        func closeSheet() {
            Task { @MainActor in
                
                addingPerson = false
            }
        }
        
        func insertPerson(person: Person){
            people.append(person)
            //save()
            //updateView()
                
        }
        
        func updatePesron(_ person: Person){
            //update person
            save()
        }
        
        func updateView() {
            self.objectWillChange.send()
            
        }
        
        func save() {
            
//            do {
//                let data = try JSONEncoder().encode(people)
//                try data.write(to: savePath, options: [.atomic])
//            }catch{
//                print("Unable to save")
//            }
        }
    }
}
