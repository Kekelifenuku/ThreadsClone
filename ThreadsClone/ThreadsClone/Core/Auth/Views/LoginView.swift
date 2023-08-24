//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI
import Firebase
struct LoginView: View {
   
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack{
                    //                text
                    
                    Image("threads")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 30)
                        .padding(.bottom,50)
                    
                    VStack {
                        
                        
                       
                        
                        
                        TextField("Enter your email", text: $viewModel.email)
                            .autocapitalization(.none)
                            .modifier(ThreadsTextFieldModifier())
                        SecureField("Enter your password", text: $viewModel.password)
                            .modifier(ThreadsTextFieldModifier())
                        
                    }
                    //                forgotten pass
                    
                    
                    Button {
                        print ("forgot password")
                    }label: {
                        
                        Text ("Forgot password?")
                            .font (. footnote)
                            . fontWeight (.semibold)
                            .padding (.top)
                            .padding (.leading, 200)
                            .foregroundColor(.black)
                    }
                    
                    
                    
                    
                    //                login button
                    
                    Button{
                                          Task{ try await viewModel.login()}
                    } label: {
                        Text("Login")
                            .font (. subheadline)
                            .fontWeight (.semibold)
                            .foregroundColor ( .white)
                            .frame(width: 360, height: 44)
                            .background (Color (.black))
                            .cornerRadius (10)
                    }
                    .padding(.vertical)
                    
                    
                    
                    
                    //                     signup
                    
                    
                    
                    NavigationLink{
                        
                        RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            
                            Text ("Don't have an account?")
                            Text ("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        .font (.footnote)
                    }
                    .padding (.vertical)
                    .padding(.top, 120)
                }
                .padding(.top, 270)
            }
            
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
