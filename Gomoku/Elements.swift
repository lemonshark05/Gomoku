//
//  Elements.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/13.
//

import Foundation
import UIKit

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
