//
//  RecordView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/15.
//

import SwiftUI

struct RecordView: View {
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image("")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width*0.8)
                    .frame(width: geo.size.width*0.8,height: geo.size.height)
            }
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(0..<20) {
                        Text("Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
