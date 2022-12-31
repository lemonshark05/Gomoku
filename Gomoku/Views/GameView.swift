//
//  GameView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/11.
//

import SwiftUI

struct GameView: View {
    @State private var blacksTurn: Bool = true
    var playerSide = GameState.black
    var AISide = GameState.white
    var whoTurn = GameState.black
    @State public var psize = UIScreen.LineSpace * 0.9
    @State public var points: Array<Elements> = Array()
    
    @State public var pointLocation: CGPoint = CGPoint()
    @State public var pimg: String = "black"
    
    var body: some View {
        ZStack {
            BroadView()
                .onTapGesture { location in
                //round to the nearest integer value
                px = Int(round(location.x/UIScreen.LineSpace))
                py = Int(round(location.y/UIScreen.LineSpace))
                if(blacksTurn){
                    points.append(Elements(row: px, col: py,status: .black))
                    blacksTurn = false
                }else{
                    points.append(Elements(row: px, col: py,status: .white))
                    blacksTurn = true
                }
            }
            ForEach(0..<points.count, id: \.self) { i in
                PieceView(ele: Elements(row: points[i].row, col: points[i].col, status: points[i].status))
            }
        }
    }
    func addChess() {
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
