//
//  ImageView.swift
//  AspasTask
//
//  Created by UKESH KUMAR on 18/05/23.
//

import SwiftUI

struct ImageView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel : UserViewModel
    
    enum PhotoSource: Identifiable {
        case photoLibrary
        case camera
        
        var id: Int {
            hashValue
        }
    }
    
    @State private var userImage = UIImage(named: "photo")!
    @State private var showOptions = false
    @State private var photoSource : PhotoSource?
    
    var body: some View {
        VStack(spacing: -20) {
            
            //MARK: NavView
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
                        .fill( LinearGradient(gradient: Gradient(colors: [.pink,  .blue]), startPoint: .leading, endPoint: .trailing))
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
            
            Spacer()
            
            //MARK: ImageView
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: userImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 700)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                    
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .scaledToFill()
                        .padding(8)
                        .background(.black).opacity(0.5)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding(.top, 20)
                        .padding(.trailing, 20)
                        .onTapGesture {
                            self.showOptions.toggle()
                        }
                    
                    
                    
                    
                }
                
                Button {
                    
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
                        .background( LinearGradient(gradient: Gradient(colors: [.pink,  .blue]), startPoint: .leading, endPoint: .trailing).opacity(0.3))
                        .clipShape(Capsule())
                    
                }
                .padding(.bottom,32)
                .onTapGesture {
                    let imagedata = userImage.jpegData(compressionQuality: 1.0)
                    viewModel.addImage(image: imagedata!)
                }
                
                
                
                
            }.padding()
            
            
            
            
        }
        .background(
            Image("aspas")
                .overlay(content: {
                    Color.black
                        .opacity(0.4)
                })
        )
        .navigationBarBackButtonHidden(true)
        .actionSheet(isPresented: $showOptions) {
            
            ActionSheet(title: Text("Choose your photo source"),
                        message: nil,
                        buttons: [
                            .default(Text("Camera")) {
                                self.photoSource = .camera
                            },
                            .default(Text("Photo Library")) {
                                self.photoSource = .photoLibrary
                            },
                            .cancel()
                        ])
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
            case .photoLibrary: ImagePicker(sourceType: .photoLibrary, selectedImage: $userImage).ignoresSafeArea()
            case .camera: ImagePicker(sourceType: .camera, selectedImage: $userImage).ignoresSafeArea()
            }
        }
        .accentColor(.primary)
        
        
        
        
        
    }
}

//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView()
//    }
//}
