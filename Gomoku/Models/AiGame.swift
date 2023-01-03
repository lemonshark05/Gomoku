//
//  AiGame.swift
//  Gomoku
//
//  Created by lemonshark on 2022/12/30.
//

import Foundation

class AiGame: ObservableObject {
    @Published var steps:String
    @Published var WinResult: Bool = false
    @Published var playWon: Bool = false
    
    init() {
        self.steps = "_h8"
    }
    
    func stepsString(points: Array<Elements>)-> String {
        steps = ""
        points.forEach { p in
            steps = steps + "_" + PDict[p.row]! + "\(p.col)"
        }
        return steps
    }
    
    func stringToPoints(mySteps: String)-> Array<Elements> {
        var res: Array<Elements> = Array()
        let steplist:[String] = mySteps.components(separatedBy: "_")
        var i:Int = 0
        for s in steplist{
//            if(i%2==0){
//                res.append(Elements(row: JDict[String(s[0])] ?? <#default value#>!, col: 1, status: .black))
//            }else {
//                res.append(Elements(row: JDict[String(s[0])] ?? <#default value#>!, col: 1, status: .white))
//            }
            i = i+1
        }
        return res
    }
    
    func aiPoint(){
        
    }
    
    func reset() {
        WinResult = false
        playWon = false
    }
    
//URL: http://81.70.152.141:8080/?stepsString=_h8_j6_g7_i9_g8_f10
//    &color=BLACK&level=HIGH&gameId=
    func getJson(){
        guard let url = URL(string: "http://81.70.152.141:8080/?stepsString="+steps) else { return }
                
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data, err == nil else { return }
            do {
                let jsonData = try JSONDecoder().decode(JsonDate.self, from: data)
                
            } catch let jsonErr {
                print("failed to decode json:", jsonErr)
             }
        }.resume() // don't forget
    }
}
