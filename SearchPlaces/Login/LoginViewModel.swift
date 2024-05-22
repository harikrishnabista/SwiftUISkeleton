//
//  LoginViewModel.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 7/3/23.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var message: String = ""
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var isFormValid = false
    @Published var isLoginSuccess = false
    
    @Published var isShowProgressView = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var dismiss: DismissAction?
    
    private let validator: LoginValidator
    private let repository: LoginRepositoryProcotol
    init(
        validator: LoginValidator,
        repository: LoginRepositoryProcotol
    ) {
        self.validator = validator
        self.repository = repository
        
        isLoginFormValid
            .receive(on: RunLoop.main)
            .assign(to: \.isFormValid, on: self)
            .store(in: &cancellableSet)
    }
    
    func onViewAppear(dismiss: DismissAction) {
        self.dismiss = dismiss
        
        // TODO: remove this test code later
        userName = "harikrista@gmail.com"
        password = "Misker01!"
    }

    func showMessage(message: String) {
        self.message = message
    }
    
    func onSubmit() {
        
        isShowProgressView = true
        
        repository.login(
            userName: userName,
            password: password
        ) { isSuccess, message in
            DispatchQueue.main.async { [weak self] in
                
                self?.isShowProgressView = false
                
                guard let self = self else { return }
                
                self.isLoginSuccess = isSuccess
                
                if let message = message {
                    showMessage(message: message)
                }
                
                if isSuccess {
                    dismiss?()
                }
            }
        }
    }
}

extension LoginViewModel {
    private var isUserNameValid: AnyPublisher<Bool, Never> {
        $userName
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .map {
                self.validator.validateUserName(userName: $0)
            }
            .eraseToAnyPublisher()
    }
    
    private var isPasswordValid: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .map {
                self.validator.validatePassWord(passWord: $0)
            }
            .eraseToAnyPublisher()
    }
    
    private var isLoginFormValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(
            isUserNameValid,
            isPasswordValid
        )
        .map { $0 && $1 }
        .eraseToAnyPublisher()
    }
}
