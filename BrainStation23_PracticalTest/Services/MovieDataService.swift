//
//  MovieDataService.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import Foundation
import Combine
import UIKit

class MovieDataService{
    //Singleton initialization
    private init(){}
    static let instance:MovieDataService = MovieDataService()
    
    //Sink subscriptions
    private var subscriptions: Set<AnyCancellable> = []
    
    //Search movies
    func searchMovies(term:String ,onComplete : @escaping (SearchResponseEntity?,String) -> Void){
        //Cancel existing requist
        subscriptions.forEach { subscription in
            subscription.cancel()
        }
        
        //Initiating URL
        guard let url = URL(string: "\(AppConstants.apiHostAddress)/3/search/movie?api_key=\(AppConstants.apiKey)&query=\(term)") else{
            return
        }
        
        //Perform remote request
        NetworkManager
            .request(url: url)
            .decode(type: SearchResponseEntity.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    onComplete(nil,"Unable to load data.")
                    break
                }
            } receiveValue: {(value) in
                onComplete(value,"")
            }
            .store(in: &subscriptions)

    }
    
    func downloadImage(imagePath:String ,onComplete : @escaping (UIImage?,String) -> Void){
        //Initiating URL
        guard let url = URL(string: "\(AppConstants.imageHostAddress)/t/p/w440_and_h660_face/\(imagePath)") else{
            return
        }
        
        //Perform remote request
        NetworkManager
            .request(url: url)
            .sink { (completion) in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    onComplete(nil,"Unable to load data.")
                    break
                }
            } receiveValue: {[weak self](value) in
                onComplete(UIImage(data: value),"")
            }
            .store(in: &subscriptions)

    }
}

