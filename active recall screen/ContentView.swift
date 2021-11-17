//
//  ContentView.swift
//  active recall screen
//
//  Created by sap on 15/11/21.
//

//
//  ContentView.swift
//  Edit Stack Screen
//
//  Created by rgs on 16/11/21.
//

import SwiftUI

class TextFieldManager : ObservableObject {
    let characterLimit = 300
    @Published var userInput = "" {
        didSet{
            if userInput.count > characterLimit {
                userInput = String(userInput.prefix(characterLimit))
            }
        }
    }
}


struct ContentView: View {
    
       @ObservedObject var textFieldManager = TextFieldManager()
       @State private var text = ""

        
    var body: some View {
        NavigationView {
            VStack{
                Button {
                    } label: {
                        HStack{
                            Image(systemName:"shuffle")
                                .foregroundColor(.black)
                            Text("Shuffle")
                                .foregroundColor(.black)
                                

                        }
                                                                }
                .padding(.all,8)
                .background(Color(UIColor(red: 136/255, green: 131/255, blue: 131/255, alpha: 0.17)))
                .foregroundColor(.white)
                .cornerRadius(10)
                .offset(y:-70)

                .navigationTitle("Active Recall")
                .navigationBarTitleDisplayMode(.inline)
                
                
                HStack(alignment: .center, spacing: 10) {
                                    Image(systemName:"arrow.left")
                                        .padding(.leading)
                                        .offset(y:-70)

                ZStack(alignment: .topLeading) {
                   RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                       .frame(height: 220)
                       .overlay( Text("Question/answer goes here"))
                        .multilineTextAlignment(TextAlignment.center)
                        .padding(.top, 10)
                        .offset(y:-70)

                        
                                        }

                                        
                                      
                                    Image(systemName:"arrow.right")
                                        .padding(.trailing)
                                        .offset(y:-70)

                                    
                                
                                }
               // VStack(spacing: 10) {
                          //              Button {
                                            
                             //           } label: {
                                           // ZStack{
                                               // Capsule()
                                                 //   .fill(Color(UIColor(red: 136/255, green: 131/255, blue: 131/255, alpha: 0.17)))
                                         //   HStack{
                ///     Text("Answer")
                //  Image(systemName:"rectangle.on.rectangle.angled")
                                                    
                                            //    }
                                          //  .padding(.all,8)
                                          //  .background(Color(UIColor(red: 136/255, green: 131/255, blue: 131/255, alpha: 0.17)))
                                         //   .foregroundColor(.black)
                                          //  .cornerRadius(10)
                                            

            //   .padding()
                                          //  .offset(y:-70)
                                      //  }
                                       
                    
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 1)))
                        .frame(height: 130)
                        .padding(.leading, 50)
                        .padding(.trailing, 50)
                    HStack {
                        CustomTextEditor.init(placeholder: "Type your answer here...", text: $textFieldManager.userInput)
                             .frame(height: 100)
                             .multilineTextAlignment(TextAlignment.center)
                            //.padding(.leading, 130)

                    }
                    


        }
            
            .toolbar {
                            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "arrow.left")
                                        .foregroundColor(.red)
                                }
                                
                            }
                            
                                    
                                
                            }
                            
                            
                            
                            
                        }

            
                
                
            }
    }

                }


 struct CustomTextEditor: View {
        let placeholder: String
        @Binding var text: String
        let internalPadding: CGFloat = 5
        var body: some View {
            ZStack(alignment: .center) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color.primary.opacity(0.25))
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .accentColor(.green)
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 15, trailing: 0))
                        .padding(internalPadding)
                    
                
                }
                ScrollView {
                    TextEditor(text: $text)
                        .frame(minHeight: 30)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(internalPadding)
                        .frame(width: 280, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
               
                
                
            }.onAppear() {
                UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 0)
                
            }.onDisappear() {
                UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)
                
            }
        }
            }
    //            ZStack(alignment: .center) {
//                if text.isEmpty {
//                    Text(placeholder)
//                        .foregroundColor(Color.primary.opacity(0.25))
//                        .fontWeight(.bold)
//                        .font(.system(size: 15))
//                        .accentColor(.green)
//                        .padding(internalPadding)
//
//                }
//                TextEditor(text: $text)
//                    .font(.system(size: 20.0,design: .rounded))
//                    .lineLimit(1)
//                    .padding(internalPadding)
//                    .multilineTextAlignment(TextAlignment.center)
//                    .frame(width: 300, height: 138, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            }.onAppear() {
//                UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 0)
//            }.onDisappear() {
//                UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 0)
//
//        }
    

    
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
            
            

        





    
