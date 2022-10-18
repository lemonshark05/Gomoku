//
//  BroadView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/16.
//

import SwiftUI

struct BroadView: View {
    
    var parray = [[Int]]()
    var gSpace = UIScreen.LineSpace
    var lineLength = UIScreen.lineLength
    var initH = UIScreen.sHeight/2 - 10*UIScreen.LineSpace/3
    var initW = UIScreen.sWidth - 2*UIScreen.LineSpace
    
    var blacksTurn: Bool = true
    var playerSide = GameState.black
    var AISide = GameState.white
    var whoTurn = GameState.black
    @State private var psize = UIScreen.LineSpace * 0.8
    @State private var point: CGPoint = CGPoint()
    @State private var pimg: String = "black"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[Color(red: 248/255, green: 206/255, blue: 99/255),Color(red: 218/255, green: 168/255, blue: 58/255), Color(red: 180/255, green: 112/255, blue: 10/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(maxWidth:UIScreen.sWidth-8, maxHeight:UIScreen.sWidth-8)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Image(pimg)
                .resizable()
                .frame(width: psize, height: psize)
                .position(point)
                .padding()
            BroadLines.frame(width:initW,height:initH)
            //add center point
            Circle().frame(width: 8,height: 8)
        }.onTapGesture { location in
            // to the nearest whole number
            px = Int(floor(location.x/UIScreen.LineSpace))
            py = Int(floor(location.y/UIScreen.LineSpace))
            addChess(PointX: px, PointY: py)
        }
    }
    var BroadLines: some View {
        GeometryReader { geo in
            Path { path in
                //15 * 15 broad
                for index in 0...14 {
                    let vOffset: CGFloat = CGFloat(index) * self.gSpace
                    path.move(to: CGPoint(x: vOffset, y: 0))
                    path.addLine(to: CGPoint(x: vOffset, y: lineLength))
                }
                for index in 0...14 {
                    let hOffset: CGFloat = CGFloat(index) * self.gSpace
                    path.move(to: CGPoint(x: 0, y: hOffset))
                    path.addLine(to: CGPoint(x: lineLength, y: hOffset))
                }
            }
            .stroke(Color.black, lineWidth: 1)
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: lineLength+1))
                path.move(to: CGPoint(x: 14*self.gSpace, y: 0))
                path.addLine(to: CGPoint(x: 14*self.gSpace, y: lineLength+1))
                //add a missing point, x:-1
                path.move(to: CGPoint(x: -1, y: 0))
                path.addLine(to: CGPoint(x: lineLength+1, y: 0))
                path.move(to: CGPoint(x: 0, y: 14*self.gSpace))
                path.addLine(to: CGPoint(x: lineLength+1, y: 14*self.gSpace))
            }
            .stroke(Color.black, lineWidth: 2)
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

struct BroadView_Previews: PreviewProvider {
    static var previews: some View {
        BroadView()
    }
}
