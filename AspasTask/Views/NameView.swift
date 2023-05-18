//
//  NameView.swift
//  AspasTask
//
//  Created by UKESH KUMAR on 17/05/23.
//

import SwiftUI

struct NameView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var name = ""
    @ObservedObject var viewModel : UserViewModel
    let limit = 12
    
    var body: some View {
        NavigationStack {
            
            VStack {
                //MARK: Nav
                HStack(spacing: 20) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    
                    HStack{
                        RoundedRectangle(cornerRadius: 12)
                            .fill( LinearGradient(gradient: Gradient(colors: [.pink,  .blue]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 80, height: 6)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 80, height: 6)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 80, height: 6)
                    }
                    
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    
                }.foregroundColor(Color(.systemGray).opacity(0.4))
                    .padding(.bottom, 24)
                
                
                //MARK: Heading
                VStack(spacing: 140){
                    VStack(spacing: -12) {
                        HStack {
                            Text("What's your")
                                .foregroundColor(.white)
                                .fontDesign(.rounded)
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                                .font(.largeTitle)
                            
                            LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .frame(width: 60,height: 80)
                                .mask {
                                    Text("first")
                                        .foregroundColor(.white)
                                        .fontDesign(.rounded)
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.center)
                                        .font(.largeTitle)
                                }
                        }
                        
                        Text("name?")
                            .foregroundColor(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                        
                    }
                    
                    
                    TextField("First Name", text: $name )
                        .onChange(of: name) { _ in
                               name = String(name.prefix(limit))
                           }
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .frame(width: 200)
                        .tracking(4)
                        .foregroundColor(.white)
                        .padding(.all, 18)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing) , lineWidth: 3)
                                .opacity(0.6)
                            
                        )
                }
                
                Spacer()
                
                //MARK: Navigation
                
                NavigationLink {
                    ImageView(viewModel: UserViewModel())
                } label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.vertical,6)
                        .padding(.horizontal,48)
                        .background(
                            
                            Capsule()
                                .stroke(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing) , lineWidth: 2)
                                .opacity(0.6)
                        )
                        .background( LinearGradient(gradient: Gradient(colors: [.pink,  .blue]), startPoint: .leading, endPoint: .trailing).opacity(0.2) )
                        .clipShape(Capsule())
                        
                    
                }
                .padding(.bottom,32)
                .onTapGesture {
                    viewModel.addUserName(userName: name)
                }
                .disabled(name.isEmpty)
                
                
                
            }
            .background(
                Image("aspas")
                    .overlay(content: {
                        Color.black
                            .opacity(0.4)
                    })
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}

//struct NameView_Previews: PreviewProvider {
//    static var previews: some View {
//        NameView()
//    }
//}
