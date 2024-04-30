//
//  ContentView.swift
//  SwiftUIShader
//
//  Created by Den Jo on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Value
    // MARK: Private
    private let startDate = Date().timeIntervalSince1970
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        TimelineView(.animation) { context in
            Text("Hello, world!")
                .font(.system(size: 120, weight: .bold))
                .foregroundStyle(ShaderLibrary.gradientEffect(.boundingRect, .float(context.date.timeIntervalSince1970 - startDate)))
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
