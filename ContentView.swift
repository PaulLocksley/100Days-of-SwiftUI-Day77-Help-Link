//
//  ContentView.swift
//  Challenge3
//
//  Created by paul locksley on 20/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        ZStack{
            VStack {
                Section{
                    //ForEach(model.groupByDay().keys.sorted(), id: \.self) { (idx)
                    ForEach(viewModel.people.sorted(), id: \.id){ person in
                        HStack{

                            Text("Person")
                                .padding()
//                            if let pic = person.picture {
//                                Image(uiImage: UIImage(data: pic)!)
//                                    .scaledToFit()
//                                    .padding()
//                            }
                            padding()
                        }
                    }
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        viewModel.AddPerson()
                        viewModel.updateView()
            	        }) {
                        Image(	systemName: "plus")
                            .padding()
                            .background(.blue.opacity(0.90))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                        
                        
                    }
                }
            }.sheet(isPresented: $viewModel.addingPerson) {
                AddPerson(viewModel: viewModel){ np in
                    viewModel.insertPerson(person: np)

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
