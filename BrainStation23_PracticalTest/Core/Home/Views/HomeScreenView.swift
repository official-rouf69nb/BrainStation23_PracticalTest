//
//  HomeScreenView.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var vm = HomeScreenViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            
            //Search box
            SearchView(text: $vm.searchTerm)
                .padding()
            
            
            //Title bar
            AppTitleBar(title: "Movie List")
            
            
            //Page body
            ZStack{
                switch vm.pageState{
                case .loaded(let data):
                    //item list
                    List{
                        ForEach (data) { movie in
                            //item templete
                            MovieItemView(item: movie)
                        }
                        .listRowBackground(Color.theme.background)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets.init(top: 0, leading: 16, bottom: 4, trailing: 16))
                    }
                    .listStyle(.plain)
                case .error:
                    //error error
                    DataLoadErrorView()
                case .loading:
                    //loading sate
                    ProgressView()
                        .foregroundColor(Color.theme.secondaryText)
                case .empty:
                    //empty state
                    EmptyListErrorView()
                    
                default :
                    //idle state
                    SearchHintView()
                }
            }.frame(maxHeight: .infinity)
        }
        .background{
            Color.theme.background.ignoresSafeArea()
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
