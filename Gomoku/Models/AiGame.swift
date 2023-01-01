//
//  AiGame.swift
//  Gomoku
//
//  Created by lemonshark on 2022/12/30.
//

import Foundation

class AiGame: ObservableObject {
    @Published var steps:String

    init() {
        self.steps = ""
    }
    
    func stepsString(points: Array<Elements>)-> String {
        steps = ""
        points.forEach { p in
            steps = steps + "_" + PDict[p.row]! + "\(p.col)"
        }
        return steps
    }
    
    func aiPoint(){
        
    }
//http://81.70.152.141:8080/?stepsString=_h8_j6_g7_i9_g8_f10
//    &color=BLACK&level=HIGH&gameId=
    func getJson(){
        "http://81.70.152.141:8080/?stepsString="+steps
        
    }
}
