//
//  Elements.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/13.
//

import Foundation
import UIKit

let GMap = [ 0:"a", 1:"b", 2:"c", 3:"d", 4:"e", 5:"f", 6:"g", 7:"h", 8:"i", 9:"j", 10:"k", 11:"l", 12:"m", 13:"n", 14:"o"]

struct Play {
    var type: Int
}

enum GameState{
    case empty, black, white
}
enum PlayerState{
    case empty, black, white
}

extension UIScreen{
    static let sWidth = UIScreen.main.bounds.size.width
    static let sHeight = UIScreen.main.bounds.size.height
    static let sSize = UIScreen.main.bounds.size
    static var LineSpace = (sWidth)/16
    static var buttonDiameter = 2 + LineSpace
    static var lineLength = ((15 - 1) * LineSpace)
}
