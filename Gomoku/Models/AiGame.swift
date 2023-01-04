//
//  AiGame.swift
//  Gomoku
//
//  Created by lemonshark on 2022/12/30.
//

import Foundation

@MainActor
class AiGame: ObservableObject {
    @Published var steps: String = "_h8"
    @Published var WinResult: Bool = false
    @Published var playWon: Bool = false
    
    var AISide:Bool = true
    var blacksTurn: Bool = false
    var points: Array<Elements> = Array()
    
    init() {
        steps = "_h8"
        points.removeAll()
        points.append(Elements(row: 8, col: 8, status: .black))
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
            if(AISide){
                points.append(Elements(row: px, col: py,status: .white))
                steps = steps + pointToString(px: px, py: py)
            }else{
                if(blacksTurn){
                    points.append(Elements(row: px, col: py,status: .black))
                    steps = steps + pointToString(px: px, py: py)
                    blacksTurn = false
                }else{
                    points.append(Elements(row: px, col: py,status: .white))
                    steps = steps + pointToString(px: px, py: py)
                    blacksTurn = true
                }
            }
//            print("PointX: \(px), PointY: \(py), String: \(pointToString(px: px, py: py))")
            print(steps)
        }
    }
    
    func withdraw(){
        print("Withdraw Button click")
        if(AISide){
            if(points.count>1){
                points.removeLast();
                if(blacksTurn&&points.count>1){
                    points.removeLast();
                    blacksTurn = false
                }else{
                    blacksTurn = true
                }
            }
        }else{
            if(points.count>1){
                points.removeLast();
                if(blacksTurn){
                    blacksTurn = false
                }else{
                    blacksTurn = true
                }
            }
        }
    }
    
    func reset() {
        steps = "_h8"
        points.removeAll()
        points.append(Elements(row: 8, col: 8, status: .black))
        blacksTurn = false
        WinResult = false
        playWon = false
    }
    
//URL: http://81.70.152.141:8080/?stepsString=_h8
//    &color=BLACK&level=HIGH&gameId=
    func getJson(){
        guard let url = URL(string: "http://81.70.152.141:8080/?stepsString="+steps) else { return }
        print("http://81.70.152.141:8080/?stepsString="+steps)
        Task{
            do {
                let sessionConfig = URLSessionConfiguration.default
                sessionConfig.timeoutIntervalForRequest = 30.0
                let (data, _) = try await URLSession.shared.data(from: url)
                let json = try JSONDecoder().decode(JsonDate.self, from: data)
                print(json)
                points.append(Elements(row: Int(json.x+1), col: Int(json.y+1), status: .black))
                steps = steps + pointToString(px: Int(json.x+1), py: Int(json.y+1))
            }catch {
                debugPrint("Error loading \(url): \(String(describing: error))")
            }
        }
    }
}
