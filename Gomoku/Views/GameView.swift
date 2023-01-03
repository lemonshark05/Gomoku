//
//  GameView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/11.
//

import SwiftUI

struct GameView: View {
    
    var playerSide = GameState.black
    var AISide = GameState.white
    var whoTurn = GameState.black
    
    @EnvironmentObject var game: AiGame
    
    var body: some View {
        ZStack {
            ButtonView()
            BroadView()
                .onTapGesture { location in
                    //round to the nearest integer value
                    px = Int(round(location.x/UIScreen.LineSpace))
                    py = Int(round(location.y/UIScreen.LineSpace))
                    game.addPiece(px: px, py: py)

                }
            //Pieces layout
            ForEach(0..<game.points.count, id: \.self) { i in
                PieceView(ele: Elements(row: game.points[i].row, col: game.points[i].col, status: game.points[i].status))
            }
            
        }.alert(isPresented: $game.WinResult) {
            Alert(title: Text(game.playWon ? "Wow" : "Oh no!"),
                message: Text(game.playWon ? "You won the match" :"Better luck next time"),
                primaryButton: .destructive(Text("Reset")) {
                game.reset()
            }, secondaryButton: .cancel())
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(AiGame())
    }
}
