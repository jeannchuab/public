//
//  Code.swift
//  CombineApp
//
//  Created by Jeann Luiz on 24/08/23.
//

import Foundation

//Some simulations of async call, could be a API Request for example
func fetchUserId(_ completionHanlder: @escaping (Result<Int, Error>) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        let result = 42
        completionHanlder(.success(result))
    }
}

func fetchName(for userId: Int, _ completionHanlder: @escaping (Result<String, Error>) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        let result = "Response"
        completionHanlder(.success(result))
    }
}

//Entry point
func run() {
    
    /* This code doesn't scale well, we have a lot of nested code and a high cyclomatic complexity.
       Hard to read and maintain. That's a example of problem that Combine solves
     */
    fetchUserId { userIdResult in
        
        switch userIdResult {
        case .success(let userId):
            
            fetchName(for: userId) { nameResult in
                switch nameResult {
                case .success(let name):
                    let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .medium)
                    print("\(timestamp): \(name)")
                case .failure(let error):
                    //Handle the error, and this could be pretty complex
                    debugPrint(error)
                }
            }
            
        case .failure(let error):
            //Handle the error, and this could be pretty complex
            debugPrint(error)
        }
    }
}


