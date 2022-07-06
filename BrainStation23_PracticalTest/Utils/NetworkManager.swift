//
//  NetworkManager.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import Foundation
import Combine

class NetworkManager{
    //Get request
    static func request(url:URL) -> AnyPublisher<Data,Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            //Request on background thread
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { (output)-> Data in
                //Handling error and response
                guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else{
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            //Receive on main thread
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func completionHandler(completion : Subscribers.Completion<Error>, onComplete : @escaping (Any?,String) -> Void){
        switch completion{
        case .finished:
            break
        case .failure(_):
            onComplete(nil,"Unable to load data.")
            break
        }
    }
}
