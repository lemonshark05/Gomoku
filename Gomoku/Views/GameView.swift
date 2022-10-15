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
    var gSpace = UIScreen.LineSpace
    var lineLength = UIScreen.lineLength
    var initH = UIScreen.sHeight/2-80
    var initW = UIScreen.sWidth-50
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[.yellow.opacity(0.4), .orange.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(maxWidth:UIScreen.sWidth-8, maxHeight:UIScreen.sWidth-8)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            BroadLines.frame(width:initW,height:initH)
        }
    }
    
    var BroadLines: some View {
        GeometryReader { geometry in
            Path { path in
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
            .stroke(Color.black, lineWidth: 1.5)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
