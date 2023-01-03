//
//  AiGame.swift
//  Gomoku
//
//  Created by lemonshark on 2022/12/30.
//

import Foundation

class AiGame: ObservableObject {
    @Published var steps: String = ""
    @Published var WinResult: Bool = false
    @Published var playWon: Bool = false
    
    @Published var blacksTurn: Bool = true
    @Published var points: Array<Elements> = Array()
    
    init() {
        steps = ""
    }
    
    func aiPoint(){
        
    }
    
    func addPiece(px:Int, py:Int){
        // (x,y) must be in (1,1)~(15,15)
        if(0<px && px<16 && 0<py && py<16){
            let s = pointToString(px: px, py: py)
            for p in points{
                if(p.str == s){
                    return
                }
            }
            if(blacksTurn){
                points.append(Elements(row: px, col: py,status: .black))
                steps = steps + pointToString(px: px, py: py)
                blacksTurn = false
            }else{
                points.append(Elements(row: px, col: py,status: .white))
                steps = steps + pointToString(px: px, py: py)
                blacksTurn = true
            }
//            print("PointX: \(px), PointY: \(py), String: \(pointToString(px: px, py: py))")
            print(steps)
        }
    }
    
    func withdraw(){
        print("Withdraw Button click")
        if(points.count>0){
            points.removeLast();
            if(blacksTurn){
                blacksTurn = false
            }else{
                blacksTurn = true
            }
        }
    }
    
    func reset() {
        steps = ""
        points.removeAll()
        blacksTurn = true
        WinResult = false
        playWon = false
    }
    
//URL: http://81.70.152.141:8080/?stepsString=_h8
//    &color=BLACK&level=HIGH&gameId=
    func getJson(){
        guard let url = URL(string: "http://81.70.152.141:8080/?stepsString="+steps) else { return }
                
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data, err == nil else { return }
            do {
                let json = try JSONDecoder().decode(JsonDate.self, from: data)
                self.points.append(Elements(row: Int(json.x), col: Int(json.y), status: .black))
                self.blacksTurn = true
            } catch let jsonErr {
                print("failed to decode json:", jsonErr)
             }
        }.resume() // don't forget
    }
}
