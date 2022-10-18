//
//  GameView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/11.
//

import SwiftUI

struct GameView: View {
    var blacksTurn: Bool = true
    var playerSide = GameState.black
    var AISide = GameState.white
    var whoTurn = GameState.black
    @State private var psize = UIScreen.LineSpace
    @State private var point: CGPoint = CGPoint()
    @State private var pimg: String = "black"
    
    var body: some View {
        ZStack {
            BroadView().onTapGesture { location in
                px = Int(location.x/UIScreen.LineSpace)
                py = Int(location.y/UIScreen.LineSpace)
                addChess(PointX: px, PointY: py)
            }
            Image(pimg)
                .resizable()
                .frame(width: psize, height: psize)
                .position(point)
                .padding()
        }
    }
    func addChess(PointX: Int, PointY: Int) {
        point = CGPoint(x: CGFloat(PointX) * UIScreen.LineSpace, y: CGFloat(PointY)*UIScreen.LineSpace)
        if(blacksTurn == true) {
            pimg = "black"
        } else {
            pimg = "white"
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
