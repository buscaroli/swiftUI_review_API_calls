//
//  ContentView.swift
//  CallingAPI
//
//  Created by Matteo on 02/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var joke: CNJoke = CNJoke()
    
    private let jokesURL = "https://api.chucknorris.io/jokes/random"
    
    @StateObject var favJokes = FavouriteJokes()
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 10){
                VStack (spacing: 10){
                    Text(joke.value)
                        .font(.title2)
                        .padding(20)
                    
                    
                    if (joke.isJokeShowing) {
                        Button(
                            action: {
                                favJokes.jokes.append(joke)
                            }
                        )   {
                                Image(systemName: "plus")
                            }
                            .font(.largeTitle)
                            .padding(10)
                            .background(.teal)
                            .foregroundColor(.white)
                            .cornerRadius(.infinity)
                            .tint(.teal)
                    }
                    
                    
                }
                
                Spacer()
                
                Button("Random Joke") {
                    Task {
                        await getRandomJoke()
                    }
                    
                }
                .font(.title)
                .buttonStyle(.bordered)
                .padding(.bottom)
                
            }
            .navigationTitle("Chuck Jokes")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        JokesListView(favJokes: favJokes)
                    } label: {Image(systemName: "list.bullet.rectangle")}
                
                }
            }
            
            
        }
    }
    
    func getRandomJoke() async {
        guard let url = URL(string: jokesURL) else {
            print("Could not create URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedJoke = try? JSONDecoder().decode(CNJoke.self, from: data) {
                
                joke = decodedJoke
            }
        } catch {
            print("invalid data")
        }
        return
    }
        
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
