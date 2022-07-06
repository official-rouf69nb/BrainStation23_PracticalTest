//
//  HomeScreenViewModel.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import Foundation
import Combine

class HomeScreenViewModel: ObservableObject{
    @Published var searchTerm : String = "marvel" //TODO (optional) initial value should be empty for production.
    @Published var pageState: SearchState = .none
    
    
    private var subscription: AnyCancellable?
    
    init(){
        ///Subscribe for search text changes
        subscription = $searchTerm
            .sink { [weak self] (term) in
                self?.performSearch(text: term)
            }
    }
    
    //Fetch movies by searching
    private func performSearch(text:String){
        
        //Set the hinttext when search text is empty
        guard !text.isEmpty else{
            self.pageState = .none
            return
        }
        
        //Show the loadingProgress before starting the network request
        self.pageState = .loading
        
        //Make a network request for searching movies
        MovieDataService.instance.searchMovies(term: text) { [weak self] (data, msg) in
            //Show error message if request failed
            guard let data = data else{
                self?.pageState = .error
                return
            }
            //Check is reults is empty or not
            //If empty then show empty message
            if(data.results.isEmpty){
                self?.pageState = .empty
            }
            //Bind search movie items to the UI
            else{
                self?.pageState = .loaded(data: data.results)
            }
        }
    }
}

///SearchState is responsible for representing the appropriate state
enum SearchState{
    case none
    case loading
    case loaded(data:[MovieEntity])
    case error
    case empty
}
