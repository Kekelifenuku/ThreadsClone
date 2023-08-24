//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
   
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
            //                text
          
                
            
            Spacer()
            VStack {
                
                Image("threads")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 30)
                    .padding(.bottom, 50)
                
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                                 SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
            }

            
//                SignUp button
            
            Button{
                Task{ try await viewModel.createUser()}
            } label: {
                Text("SignUp")
                    .font (. subheadline)
                .fontWeight (.semibold)
                .foregroundColor ( .white)
                .frame(width: 360, height: 44)
                .background (Color (.black))
                .cornerRadius (10)
            }
            .padding(.vertical)
            
            
   

//                     signup

               
              Button {
dismiss()
                } label: {
                    HStack(spacing: 3) {
                    Text ("Already have an account?")
                    Text ("Login")
                            .fontWeight(.semibold)
                          }
                    .font (.footnote)
                    .foregroundColor(.black)
                }
                .padding (.vertical)
                .padding(.top, 100)
            }
        }
    }


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
