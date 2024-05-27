//
//  BeadCircle.swift
//  Rosbeads Watch App
//
//  Created by Jonathan Andrew Yoel on 22/05/24.
//

import SwiftUI

struct BeadCircle: View {
    let progress: Double
    let beadCount: Int
    let spacing: CGFloat
    let beadSize: CGFloat
    let largeBeadSize: CGFloat
    let specialIndices: [Int]
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<beadCount) { index in
                Circle()
                    .foregroundColor(self.color)
                    .frame(width: self.size(for: index), height: self.size(for: index))
                    .opacity(self.opacity(for: index))
                    .position(self.position(for: index, in: geometry.size))
            }
        }
    }
    
    func opacity(for index: Int) -> Double {
        let threshold = Int(Double(beadCount) * progress)
        return index < threshold ? 1.0 : 0.1
    }
    
    func size(for index: Int) -> CGFloat {
        return specialIndices.contains(index) ? largeBeadSize : beadSize
    }
    
    func position(for index: Int, in size: CGSize) -> CGPoint {
       // let adjustedBeadCount = beadCount + Int(Double(beadCount) * (spacing - 1.0))
        let angle = Angle(degrees: (Double(index) / Double(beadCount)) * 360.0 - 90.0)
        let radius = min(size.width, size.height) / 2 - max(beadSize, largeBeadSize) / 2
        let x = radius * cos(CGFloat(angle.radians)) + size.width / 2
        let y = radius * sin(CGFloat(angle.radians)) + size.height / 2
        return CGPoint(x: x, y: y)
    }
}
