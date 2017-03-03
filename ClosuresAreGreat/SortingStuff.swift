//
//  SortingStuff.swift
//  ClosuresAreGreat
//
//  Created by Ron Don Volante on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


struct ToyBin {
    
    var ships: [Ship] = []
    var books: [Book] = []
    var bowlingPins: [BowlingPin] = []
    var musicCDs: [MusicCD] = []
    
    // TODO: Implement all of the sort functions (lets organize this toy bin!)
    
    mutating func sortShips(){
        ships = ships.sorted(by: {wayToSortShips($0, $1)})
    }
    
    private func wayToSortShips(_ ship1: Ship, _ ship2: Ship) -> Bool{
        guard ship1.name != "Titanic" else {return true}
        return ship1.age > ship2.age
    }
    
    mutating func sortBooks(){
        books = books.sorted(by: { (book1: Book, book2: Book) -> Bool in
            let book1char = Array(book1.name.lowercased().characters)[0]
            let book2char = Array(book2.name.lowercased().characters)[0]
            guard let book1AlphabetizedValue = alphabet["\(book1char)"] else {return false}
            guard let book2AlphabetizedValue = alphabet["\(book2char)"] else {return false}
            return book1AlphabetizedValue < book2AlphabetizedValue
        })
    }//i am doing it without shorthand to practice and gain understanding
    //i have never used closures without shorthand, god it
    
    mutating func sortBowlingPins(){
        bowlingPins = bowlingPins.sorted(by: {$0.color.rawValue < $1.color.rawValue})
    }
    
    mutating func sortMusicCDs(){
        musicCDs = musicCDs.sorted(by: {(cd1: MusicCD, cd2: MusicCD)->Bool in
            guard cd1.name != "Drake" else {return true}
            let cd1char = Array(cd1.name.lowercased().characters)[0]
            let cd2char = Array(cd2.name.lowercased().characters)[0]
            guard let cd1AlphabetizedValue = alphabet["\(cd1char)"] else {return false}
            guard let cd2AlphabetizedValue = alphabet["\(cd2char)"] else {return false}
            return cd1AlphabetizedValue < cd2AlphabetizedValue
        })
    }//this was giving me musicCDs values as tuples when i was using shorthand??? so i didnt
    
    mutating func changeColorOfAllPins(to myColor: Color){
        bowlingPins = bowlingPins.map({
            var pinToReturn = $0
            pinToReturn.changeColor(to: myColor)
            return pinToReturn
        })
    }
}


struct Ship {
    var name: String
    var age: Int
}


struct Book {
    var name: String
    var year: Int
    var author: String
}


struct BowlingPin {
    var name: String
    var film: String
    var color: Color
}


extension BowlingPin {
    mutating func changeColor(to color: Color) {
        self.color = color
    }
}


enum Color: Int {
    case red, orange, yellow, green, blue, indigo, violet
}

struct MusicCD {
    var name: String
    var year: Int
    var songs: [String]
}

let alphabet: [String:Int] = ["a":1,"b":2,"c":3,"d":4,"e":4,"f":6,"g":7,"h":8,"i":9,"j":10,"k":11,"l":12,"m":13,"n":14,"o":15,"p":16,"q":17,"r":18,"s":19,"t":20,"u":21,"v":22,"w":23,"x":24,"y":25,"z":26]
