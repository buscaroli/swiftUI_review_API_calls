# swiftUI_review_API_calls
Reviuwing SwiftUI: Making API calls

## Why

Reviewing the Basics of SwiftUI and iOS development in general.

## What

- Call and API to get a random joke from [Chuck Norris Jokes API](https://api.chucknorris.io/)
- Show the result on the main View
- Allow user tosave the result to UserDefaults
- Allow user to View and delete saved jokes from a separate View

## Some Tools used
- NavigationStack
- UserDefaults
- JSONEncoder() and JSONDecoder()
- @ObservableObject, @ObservedObject, @StateObject, @Published

## How

- Created a struct for the Joke
- Created a struct for the array of jokes with:
  - computed properties: to check if the array is empty
  - DidSet: to save the array to UserDefaults every time a joke is added

## TODO

- Add an extra API call (The previous API's url for the icon wasn't working, might use a separate one)
- Add some styling as it is currently left very basic as mainly interested to review thr main concepts.
