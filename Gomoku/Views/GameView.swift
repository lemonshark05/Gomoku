//
//  GameView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/11.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: AiGame
    var playerSide = GameState.black
    var whoTurn = GameState.black
    
    var body: some View {
        ZStack {
            ButtonView()
            BroadView()
                .onTapGesture { location in
                    //round to the nearest integer value
                    px = Int(round(location.x/UIScreen.LineSpace))
                    py = Int(round(location.y/UIScreen.LineSpace))
                    if(game.AISide){
                        if(!game.blacksTurn){
                            game.addPiece(px: px, py: py)
                            game.getJson()
                        }
                    }else{
                        game.addPiece(px: px, py: py)
                    }
                }.alert(isPresented: $game.WinResult) {
                    Alert(title: Text(game.playWon ? "Wow" : "Oh no!"),
                        message: Text(game.playWon ? "You won the match" :"Better luck next time"),
                          dismissButton: .default(Text("Ok")))
                }
            PieceView(ele: Elements(row: game.points[0].row, col: game.points[0].col, status: game.points[0].status))
            //Pieces layout
            ForEach(1..<game.points.count, id: \.self) { i in
                PieceView(ele: Elements(row: game.points[i].row, col: game.points[i].col, status: game.points[i].status))
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(AiGame())
    }
}
