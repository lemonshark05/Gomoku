//
//  Elements.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/13.
//

import SwiftUI
import UIKit

class Elements: ObservableObject {
    var row: Int = 0
    var col: Int = 0
    var status: GameState = .black
    var str: String = "_h8"
    
    var image: Image {
        switch status {
        case .null:
            return Image("")
        case .black:
            return Image("black")
        case .white:
            return Image("white")
        }
    }
    
    init(row: Int, col: Int,status: GameState) {
        self.row = row
        self.col = col
        self.status = status
        self.str = pointToString(px: row, py: col)
    }
}

func pointToString(px:Int, py:Int)-> String {
    return "_\(PDict[px]!)\(py)"
}

var px: Int = 0
var py: Int = 0

//, 16:"p", 17:"q", 18:"r", 19:"t"
let PDict:[Int:String] = [ 1:"a", 2:"b", 3:"c", 4:"d", 5:"e", 6:"f", 7:"g", 8:"h", 9:"i", 10:"j", 11:"k", 12:"l", 13:"m", 14:"n", 15:"o"]
//, "p":16, "q":17, "r":18, "t":19
let JDict:[String:Int] = [ "a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8, "i":9, "j":10, "k":11, "l":12, "m":13, "n":14, "o":15]

enum GameState{
    case null,black, white
}

//{"input": "h8_a1_i9_a2", "x": 9, "y": 9}
struct JsonDate: Decodable {
    let input: String
    let x: Int
    let y: Int
}

extension UIScreen{
    static let sWidth = UIScreen.main.bounds.size.width
    static let sHeight = UIScreen.main.bounds.size.height
    static let sSize = UIScreen.main.bounds.size
    static let LineSpace = (sWidth)/16
    static let sideW = LineSpace/4
    static var buttonDiameter = 2 + LineSpace
    static var lineLength = (14 * LineSpace)
}
