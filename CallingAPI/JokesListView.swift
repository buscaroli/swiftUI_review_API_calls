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
            VStack (alignment: .leading, spacing: 5){
                if (!favJokes.hasJokes) {
                    Text("No Jokes yet!")
                        .font(.largeTitle)
                        .padding(.top)
                }
                List {
                    ForEach(favJokes.jokes) { joke in
                        Text(joke.value)
                            .font(.title3)
                            .padding()
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("Jokes List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func delete(at offsets: IndexSet) {
        favJokes.jokes.remove(atOffsets: offsets)
    }
    
    
    
    
}

struct JokesListView_Previews: PreviewProvider {
    static var previews: some View {
        JokesListView(favJokes: FavouriteJokes())
    }
}
