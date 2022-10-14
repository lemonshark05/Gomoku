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
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(maxWidth:UIScreen.sWidth-10, maxHeight:UIScreen.sWidth-10)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            BroadLines
        }
    }
    
    var BroadLines: some View {
        Path() { path in
                path.move(to: CGPoint(x: 0, y: UIScreen.sWidth))
                path.addLine(to: CGPoint(x: UIScreen.lineLength, y: UIScreen.sWidth))
            }
            .stroke(Color.black, lineWidth: 2)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
