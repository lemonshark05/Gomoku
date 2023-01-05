//
//  ButtonView.swift
//  Gomoku
//
//  Created by lemonshark on 2023/1/2.
//

import SwiftUI

struct ButtonView: View {
    
    @EnvironmentObject var game: AiGame
    
    var body: some View {
        Form{
            Button(action: game.withdraw
                   , label: {
                HStack(content: {
                    Image(systemName: "arrowshape.turn.up.backward.2.fill")
                        .font(.title).bold()
                    Text("Back")
                        .font(.title).bold()
                })
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
            })
            Button(action: game.reset
                   , label: {
                HStack(content: {
                    Image(systemName: "circle.circle.fill")
                        .font(.title).bold()
                    Text("Reset")
                        .font(.title).bold()
                })
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
            })
        }
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView().environmentObject(AiGame())
    }
}
