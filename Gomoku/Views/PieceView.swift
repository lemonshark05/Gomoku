//
//  PieceView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/12/31.
//

import SwiftUI

struct PieceView: View {
    var ele: Elements
    
    var body: some View {
        ele.image
            .resizable()
            .frame(width: UIScreen.LineSpace,
                   height: UIScreen.LineSpace,alignment: .center)
//            .position(CGPoint(x:(CGFloat(ele.row)-0.3) * UIScreen.LineSpace, y: (CGFloat(ele.col)+2.7)*UIScreen.LineSpace))
            .position(CGPoint(x:CGFloat(ele.row) * UIScreen.LineSpace, y: CGFloat(ele.col) * UIScreen.LineSpace))
            .padding()
    }
}
struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceView(ele: Elements(row: 0, col:0, status: .black))
    }
}
