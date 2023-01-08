//
//  JokesListView.swift
//  CallingAPI
//
//  Created by Matteo on 08/01/2023.
//

import SwiftUI

struct JokesListView: View {
    @ObservedObject var favJokes: FavouriteJokes
    
    var body: some View {
        NavigationView {
            ScrollView {
                if (!favJokes.hasJokes) {
                    Text("No Jokes yet!")
                        .font(.largeTitle)
                        .padding(.top)
                }
                
                LazyVStack (alignment: .leading, spacing: 5){
                    ForEach(favJokes.jokes) { joke in
                        Text(joke.value)
                            .font(.title3)
                            .padding()
                    }
                }
            }
            .navigationTitle("Jokes List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct JokesListView_Previews: PreviewProvider {
    static var previews: some View {
        JokesListView(favJokes: FavouriteJokes())
    }
}
