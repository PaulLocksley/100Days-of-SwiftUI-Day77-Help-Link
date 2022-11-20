//
//  AddPerson.swift
//  Challenge3
//
//  Created by paul locksley on 22/10/2022.
//

import SwiftUI

struct AddPerson: View {
    @Environment(\.dismiss) var dismiss
    //
    @ObservedObject var viewModel: ViewModel

    @ObservedObject var viewModel: ContentView.ViewModel
    @State var name: String = ""
    @State var desc: String = ""
    @State var  picture: UIImage?
    var onSave: (Person) -> Void
    @State var addingPicture = false
    @State var im: Image?

    var body: some View {
        VStack{
            Form{
                Section{
                    if let picture {
                        Image(uiImage: picture)
                            .scaledToFill()
                    }else{
                        Button{
                            addingPicture = true
                        }label: {
                            HStack{
                                padding()
                                Text("Add Picture")
                                Image(systemName: "camera")
                                    .font(.title)
                                padding()
                            }
                        }
                    }
                }
                
                Section{
                    TextField("Name", text: $name)
                    TextField("Description", text: $desc)
                }
                HStack{
                    Button("Add New Person"){
                        let newPerson = Person(Picture: picture,name: name, desc: desc)
                        onSave(newPerson)
                        dismiss()
                        
                    }
                    
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding(.all, 2)
                    .frame(width: 500, alignment: .center)
                }
            }
            
        }
        .sheet(isPresented: $addingPicture){
                ImagePicker(image: $picture)
            }
    }

}

//struct AddPerson_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPerson(){Pesron in
//
//        }
//    }
//}
