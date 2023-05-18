//
//  NumberView.swift
//  AspasTask
//
//  Created by UKESH KUMAR on 17/05/23.
//

import SwiftUI

struct NumberView: View {
    
    
    @State var phoneNumber = ""
    @StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var viewModel : UserViewModel
    let limit = 10
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                
                VStack(spacing: 100) {
                    
                    VStack(spacing: 36) {
                        
                        //MARK: Heading
                        Text("What's your phone number?")
                            .foregroundColor(.white)
                            .fontDesign(.rounded)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                            .padding(.horizontal, 20)
                        
                        
                        Text("You'll get an OTP. Your number is not visible to others.")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .font(.title3)
                            .padding(.horizontal, 36)
                        
                    }
                    .padding(.top, 48)
                    
                    //MARK: Phone
                    
                    HStack(alignment: .center, spacing: 24) {
                        Image("india")
                            .resizable()
                            .frame(width: 48, height: 48)
                        
                        TextField("XXXXX - XXXXX", text: $phoneNumber)
                            .onChange(of: phoneNumber) { _ in
                                   phoneNumber = String(phoneNumber.prefix(limit))
                               }
                            .font(.headline)
                            .tracking(5)
                            .multilineTextAlignment(.center)
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .keyboardType(.numberPad)
                        
                    }
                    .padding(.all, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing) , lineWidth: 3)
                            .opacity(0.6)
                        
                    )
                    
                    
                }
                
                Spacer()
                
                //MARK: Navigation
                
                NavigationLink {
                    NameView( viewModel: UserViewModel())
                    
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
                        .background( LinearGradient(gradient: Gradient(colors: [.pink,  .blue]), startPoint: .leading, endPoint: .trailing).opacity(0.2))
                        .clipShape(Capsule())
                    
                }
                .padding(.bottom, 32)
                .onTapGesture {
                    viewModel.addPhone(phone: phoneNumber)
                }
                .disabled(phoneNumber.isEmpty)
                
                
                
                
            }.background(
                Image("aspas")
                    .overlay(content: {
                        Color.black
                            .opacity(0.4)
                    })
            )
        }
    }
}

//struct NumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        NumberView()
//    }
//}
