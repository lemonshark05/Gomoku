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
    
    @Published var AISide:Bool = true
    @Published var blacksTurn: Bool = false
    @Published var points: Array<Elements> = Array()
    @Published var matrix:[[Int]] = Array(repeating: Array(repeating: 0, count: 15), count: 15)
    
    init() {
        points.removeAll()
        steps = ""
        matrix = Array(repeating: Array(repeating: 0, count: 15), count: 15)
        addPiece(px: 8, py: 8, status: .black)
    }
    
    func isWin(){
        // horizontal check
        for i in 0...14 {
            for j in 0...9{
                if (matrix[i][j] != 0) {
                    if (matrix[i][j]==matrix[i][j+1] &&
                        matrix[i][j+1]==matrix[i][j+2] &&
                        matrix[i][j+2]==matrix[i][j+3] &&
                        matrix[i][j+3]==matrix[i][j+4]) {
                        print("Win!!!")
                        WinResult = true
                        return
                    }
                }
            }
        }
        // vertical check
        for i in 0...9 {
            for j in 0...14{
                if (matrix[i][j] != 0) {
                    if (matrix[i][j]==matrix[i+1][j] &&
                        matrix[i+1][j]==matrix[i+2][j] &&
                        matrix[i+2][j]==matrix[i+3][j] &&
                        matrix[i+3][j]==matrix[i+4][j]) {
                        print("Win!!!")
                        WinResult = true
                        return
                    }
                }
            }
        }
        // diagonal check 1
        for i in 0...10 {
            for j in 0...10{
                if (matrix[i][j] != 0) {
                    if (matrix[i][j]==matrix[i+1][j+1] &&
                        matrix[i+1][j+1]==matrix[i+2][j+2] &&
                        matrix[i+2][j+2]==matrix[i+3][j+3] &&
                        matrix[i+3][j+3]==matrix[i+4][j+4]) {
                        print("Win!!!")
                        WinResult = true
                        return
                    }
                }
            }
        }
        // diagonal check 2
        for i in 0...10 {
            for j in 4...14{
                if (matrix[i][j] != 0) {
                    if (matrix[i][j]==matrix[i+1][j-1] &&
                        matrix[i+1][j-1]==matrix[i+2][j-2] &&
                        matrix[i+2][j-2]==matrix[i+3][j-3] &&
                        matrix[i+3][j-3]==matrix[i+4][j-4]) {
                        WinResult = true
                        return
                    }
                }
            }
        }
    }
    
    func pointsToString(slist: Array<Elements>) -> String{
        var res:String = ""
        for p in points{
            res = res+p.str
        }
        return res
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
                matrix[px-1][py-1] = 2
            }else{
                if(blacksTurn){
                    points.append(Elements(row: px, col: py,status: .black))
                    steps = steps + pointToString(px: px, py: py)
                    matrix[px-1][py-1] = 1
                    blacksTurn = false
                }else{
                    points.append(Elements(row: px, col: py,status: .white))
                    steps = steps + pointToString(px: px, py: py)
                    matrix[px-1][py-1] = 2
                    blacksTurn = true
                }
            }
            isWin()
            print(steps)
        }
    }
    
    func addPiece(px:Int, py:Int, status: GameState){
        points.append(Elements(row: px, col: py, status: .black))
        steps = steps + pointToString(px: px, py: py)
        matrix[px-1][py-1] = 1
        isWin()
    }
    
    func deleteMatrix(p:Elements){
        matrix[p.row-1][p.col-1] = 0
    }
    
    func withdraw(){
        print("Withdraw Button click")
        if(AISide){
            if(points.count>2){
                deleteMatrix(p: points[points.endIndex-1])
                points.removeLast();
                deleteMatrix(p: points[points.endIndex-1])
                points.removeLast();
                steps = pointsToString(slist: points)
                print(steps)
            }
        }else{
            if(points.count>1){
                deleteMatrix(p: points[points.endIndex-1])
                points.removeLast();
                steps = pointsToString(slist: points)
                if(blacksTurn){
                    blacksTurn = false
                }else{
                    blacksTurn = true
                }
            }
        }
    }
    
    func reset() {
        steps = ""
        points.removeAll()
        matrix = Array(repeating: Array(repeating: 0, count: 15), count: 15)
        addPiece(px: 8, py: 8, status: .black)
        blacksTurn = false
        WinResult = false
        playWon = false
    }
    
//URL: http://81.70.152.141:8080/?stepsString=_h8
//    &color=BLACK&level=HIGH&gameId=
    func getJson(){
        guard let url = URL(string: "http://81.70.152.141:8080/?stepsString="+steps) else { return }
        Task{
            do {
                let sessionConfig = URLSessionConfiguration.default
                sessionConfig.timeoutIntervalForRequest = 30
                sessionConfig.timeoutIntervalForResource = 30
                sessionConfig.waitsForConnectivity = true
                let session = URLSession(configuration: sessionConfig);
                let (data, _) = try await session.data(from: url)
                let json = try JSONDecoder().decode(JsonDate.self, from: data)
                print(json)
                addPiece(px: Int(json.x+1), py: Int(json.y+1), status: .black)
            }catch {
                debugPrint("Error loading \(url): \(String(describing: error))")
            }
        }
    }
}
