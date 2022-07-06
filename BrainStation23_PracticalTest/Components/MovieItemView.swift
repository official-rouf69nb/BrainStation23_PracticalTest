//
//  MovieItemView.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import SwiftUI

class MovieItemViewModel: ObservableObject{
    
    var movie: MovieEntity
    @Published var image: UIImage?
    
    
    //init and perform image loading
    init(movie:MovieEntity){
        self.movie = movie
        loadImage(movieEntity: movie)
    }
    

    //fetch image from server
    func loadImage(movieEntity: MovieEntity){
        MovieDataService.instance.downloadImage(imagePath: movieEntity.posterPath ?? "") { [weak self] (data, msg) in
            self?.image = data
        }
    }
}

struct MovieItemView: View {
    @ObservedObject var vm:MovieItemViewModel
    
    init(item:MovieEntity){
        _vm = ObservedObject.init(wrappedValue:  MovieItemViewModel(movie: item))
    }
    
    
    var body: some View {
        ZStack(alignment: .leading){
            //background
            Color.theme.controllBackground
                .cornerRadius(8)
                .padding(.top,20)
              
            //Content section
            HStack{
                //Poster image section
                Color.theme.controllBackground
                    .aspectRatio(440/660,contentMode: .fit)
                    .overlay{
                        //Loaded image
                        if let image = vm.image{
                            Image(uiImage: image)
                                .resizable()
                                .frame(maxWidth:.infinity, maxHeight: .infinity)
                                .cornerRadius(4)
                                .clipped()
                        }
                        //Placeholder image
                        else{
                            Image(uiImage: UIImage(systemName: "photo")!.withTintColor(UIColor.white))
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .cornerRadius(4)
                        }
                    }
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
                    .padding(.leading)
                    .padding(.bottom)
                
                //Content text section
                VStack(alignment: .leading, spacing: 10){
                    //Title text
                    Text(vm.movie.title)
                        .font(.title3)
                        .foregroundColor(Color.theme.primaryText)
                        .lineLimit(2)
                    
                    //Overview text
                    Text(vm.movie.overview)
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                }
                .padding(.top,12)
                .padding(.horizontal, 8)
            }
            
        }
        .aspectRatio(2, contentMode: .fit)
        .padding(.vertical)
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(item: MovieEntity(id: 0, adult: false, backdropPath: "", genreIDS: [0], originalTitle: "", overview: "The story follows Carol Danvers as she becomes one of the universe’s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.", popularity: 0.0, posterPath: "", releaseDate: "", title: "Captain Marvel", video: true, voteAverage: 0, voteCount: 0))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
