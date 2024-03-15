//
//  ContentView.swift
//  WordScramble
//
//  Created by David Huang on 3/9/24.
/// learn more about Guard here: https://www.youtube.com/watch?v=y1wVyNRJook

import SwiftUI

struct ContentView: View {
    @State private var useWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ForEach(useWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)// performs this function when this view appears
            .alert(errorTitle, isPresented: $showingError) {
                
            } message : {
                Text(errorMessage)
            }
        }
    }
    
    // load words from start.txt, or throw fatal error
    func startGame() {
        // if we are able to find start.txt and attach it to startWordsURL
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // if we are able to load the contents of startWordsURL
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n") // get a random word from startWords and assign it to rootWord
                rootWord = allWords.randomElement() ?? "silkworm"
                return // once done, return
            }
        }
        // if the func reaches here, fatal error has occured: cannot get start.txt
        fatalError("Could not load start.txt from bundle.")
    }
    
    // handle entry field
    func addNewWord() {
        // sets the entry to lowercased, with white spaces and new lines trimmed out
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit out if entry is empty
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used alread", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)!'")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up!")
            return
        }
        
        // insert new word at first position with animation
        withAnimation {
            useWords.insert(answer, at: 0)
        }
        
        // reset
        newWord = ""
    }
    
    // avoid duplicates
    func isOriginal(word: String) -> Bool {
        !useWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        // loop through each letter of the entered word
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return mispelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}
 
