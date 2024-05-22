//
//  LoginView.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 6/26/23.
//

import SwiftUI

struct LoginView: View {

    @StateObject var vm: LoginViewModel
    
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    var body: some View {
        VStack(spacing: 24) {
            
            HStack {
                Text("Login")
                    .font(.headline)
                
                Spacer()
            }
            
            Spacer()
            
            TextField("Email", text: $vm.userName)
                .keyboardType(.emailAddress)
                .padding()
                .border(Color.gray)
                

            SecureField("Password", text: $vm.password)
                .padding()
                .border(Color.gray)
            
            Button {
                vm.onSubmit()
            } label: {
                HStack (spacing: 10) {
                    Text("Submit")
                        .foregroundColor(vm.isFormValid ? .blue : .gray)
                    
                    if vm.isShowProgressView {
                        ProgressView()
                    }
                }
            }
            .disabled(!vm.isFormValid)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Text("Don't have an account ?")
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(24)
        .onAppear {
            vm.onViewAppear(dismiss: dismiss)
        }
    }
}

#Preview {
    ViewFactory.getViewFor(viewType: .loginView)
        .environmentObject(LoadingSpinnerViewModel())
}


