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
    private let startDate = Date()
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        TimelineView(.animation) { context in
            VStack(spacing: 40) {
                titleView
                    .foregroundStyle(ShaderLibrary.gradientEffect(.boundingRect, .float(startDate.distance(to: context.date))))
                
                titleView
                    .foregroundStyle(ShaderLibrary.gradientEffect2(.boundingRect, .float(startDate.distance(to: context.date))))
                
                titleView
                    .foregroundStyle(ShaderLibrary.gradientEffect3(.boundingRect, .float(startDate.distance(to: context.date))))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .ignoresSafeArea()
    }
    
    // MARK: Private
    private var titleView: some View {
        Text("Hello, world!")
            .font(.system(size: 100, weight: .bold))
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
