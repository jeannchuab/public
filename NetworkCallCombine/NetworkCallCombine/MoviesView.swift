//
//  ContentView.swift
//  NetworkCallCombine
//
//  Created by Jeann Luiz on 24/08/23.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        List(viewModel.movies) { movie in
            HStack {
                AsyncImage(url: movie.posterURL) { poster in
                    poster
                        .resizable()
                        .aspectRatio (contentMode: .fit)
                        .frame (width: 100)
                } placeholder: {
                    ProgressView()
                        .frame (width: 100)
                }
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font (.headline)
                    Text(movie.overview)
                        .font(.caption)
                        .lineLimit(3)
                }
            }
        }
        .onAppear {
            viewModel.fetchInitialData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
