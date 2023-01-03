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
            BroadView()
                .onTapGesture { location in
                    //round to the nearest integer value
                    px = Int(round(location.x/UIScreen.LineSpace))
                    py = Int(round(location.y/UIScreen.LineSpace))
                    // (x,y) must be in (1,1)~(15,15)
                    if(0<px && px<16 && 0<py && py<16){
                        if(game.blacksTurn){
                            game.points.append(Elements(row: px, col: py,status: .black))
                            game.blacksTurn = false
                        }else{
                            game.points.append(Elements(row: px, col: py,status: .white))
                            game.blacksTurn = true
                        }
                    }
                }
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
