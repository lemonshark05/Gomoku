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
    @State public var psize = UIScreen.LineSpace * 0.9
    @State public var point: CGPoint = CGPoint()
    @State public var pimg: String = "black"
    
    var body: some View {
        ZStack {
            BroadView()
                .onTapGesture { location in
                //round to the nearest integer value
                px = Int(round(location.x/UIScreen.LineSpace))
                py = Int(round(location.y/UIScreen.LineSpace))
                print("PointX: \(px), PointY: \(py)")
                    point = CGPoint(x: (CGFloat(px)-0.3) * UIScreen.LineSpace, y: (CGFloat(py)+2.7)*UIScreen.LineSpace)

            }
            Image(pimg)
                .resizable()
                .scaleEffect(anchor: .top)
                .frame(width: psize, height: psize)
                .position(point)
                .padding()
        }
    }
    func addChess(PointX: Int, PointY: Int) {
        print("PointX: \(PointX), PointY: \(PointY)")
        point = CGPoint(x: CGFloat(PointX) * UIScreen.LineSpace, y: CGFloat(PointY)*UIScreen.LineSpace)
        if(blacksTurn == true) {
            pimg = "black"
        } else {
            pimg = "white"
        }
//        Circle()
//            .fill(Color.red)
//            .scaleEffect(anchor: .top)
//            .frame(width: psize,height: psize)
//            .position(point)
//        Image(pimg)
//            .resizable()
//            .scaleEffect(anchor: .top)
//            .frame(width: psize, height: psize)
//            .position(point)
//            .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
