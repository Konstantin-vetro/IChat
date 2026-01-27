//
//  AuthenticationService.swift
//  IChat
//
//  Created by Гость on 27.01.2026.
//

import UIKit
import Firebase
import FirebaseAuth

final class AuthenticationService {
    // MARK: - Properties
    static let shared = AuthenticationService()

    // MARK: - Private properties
    private let auth = Auth.auth()

    // MARK: - Methods

    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        guard let email, let password else { return }
        auth.signIn(withEmail: email, password: password) { result, error in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }

    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        guard let email, let password else { return }
        auth.createUser(withEmail: email, password: password) { result, error in
//            guard let error else { return }
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
}
