//
//  BroadView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/16.
//

import SwiftUI

struct BroadView: View {
    
    var gSpace = UIScreen.LineSpace
    var lineLength = UIScreen.lineLength
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[Color(red: 248/255, green: 206/255, blue: 99/255),Color(red: 218/255, green: 168/255, blue: 58/255), Color(red: 180/255, green: 112/255, blue: 10/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(maxWidth:UIScreen.sWidth-UIScreen.sideW, maxHeight:UIScreen.sWidth-UIScreen.sideW)
                .clipShape(RoundedRectangle(cornerRadius: UIScreen.sideW+2))
            BroadLines.frame(width:lineLength,height:lineLength,alignment: .center)
            //add center point
            Circle().frame(width: UIScreen.sideW,height: UIScreen.sideW)
            Circle().position(CGPoint(x: self.gSpace*4+UIScreen.sideW/2-1, y: self.gSpace*4+UIScreen.sideW/2-1))
                .frame(width: UIScreen.sideW-2,height: UIScreen.sideW-2)
            Circle().position(CGPoint(x: -self.gSpace*4+UIScreen.sideW/2-1, y: -self.gSpace*4+UIScreen.sideW/2-1))
                .frame(width: UIScreen.sideW-2,height: UIScreen.sideW-2)
            Circle().position(CGPoint(x: self.gSpace*4+UIScreen.sideW/2-1, y: -self.gSpace*4+UIScreen.sideW/2-1))
                .frame(width: UIScreen.sideW-2,height: UIScreen.sideW-2)
            Circle().position(CGPoint(x: -self.gSpace*4+UIScreen.sideW/2-1, y: self.gSpace*4+UIScreen.sideW/2-1))
                .frame(width: UIScreen.sideW-2,height: UIScreen.sideW-2)
        }
    }
    var BroadLines: some View {
        GeometryReader { geo in
            Path { path in
                //15 * 15 broad
                for index in 0...14 {
                    let vOffset: CGFloat = CGFloat(index) * self.gSpace
                    path.move(to: CGPoint(x: vOffset, y: 0))
                    path.addLine(to: CGPoint(x: vOffset, y: lineLength))
                }
                for index in 0...14 {
                    let hOffset: CGFloat = CGFloat(index) * self.gSpace
                    path.move(to: CGPoint(x: 0, y: hOffset))
                    path.addLine(to: CGPoint(x: lineLength, y: hOffset))
                }
            }
            .stroke(Color.black, lineWidth: 1)
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: lineLength+1))
                path.move(to: CGPoint(x: 14*self.gSpace, y: 0))
                path.addLine(to: CGPoint(x: 14*self.gSpace, y: lineLength+1))
                //add a missing point, x:-1
                path.move(to: CGPoint(x: -1, y: 0))
                path.addLine(to: CGPoint(x: lineLength+1, y: 0))
                path.move(to: CGPoint(x: 0, y: 14*self.gSpace))
                path.addLine(to: CGPoint(x: lineLength+1, y: 14*self.gSpace))
            }
            .stroke(Color.black, lineWidth: 2)
        }
    }
}

struct BroadView_Previews: PreviewProvider {
    static var previews: some View {
        BroadView()
    }
}
