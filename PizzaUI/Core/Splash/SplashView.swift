//
//  SplashView.swift
//  PizzaUI
//
//  Created by Brenda Saavedra Cantu on 19/10/23.
//

import SwiftUI

struct SplashView: View {
    // MARK: View Properties
    @State private var progress = 0.01
    @State private var isNavigationActive = false
    
    var body: some View {
        VStack(alignment: .center) {
            if (!isNavigationActive) {
                GeometryReader { geo in
                    Image("pizzaSplash")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 344, height: 344)
                        .mask(SliceMask(progress: progress).fill(style: FillStyle(eoFill: true)))
                        .onAppear {
                            // Start a timer to increment the progress
                            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                withAnimation(Animation.linear(duration: 1)) {
                                    if progress < 1.0 {
                                        progress += 1.0 / 8.0
                                    } else {
                                        // Image is fully shown, activate navigation
                                        isNavigationActive = true
                                    }
                                }
                            }
                            timer.fire()
                        }
                }
                .frame(width: 344, height: 344)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .foregroundColor(Color.pBackground)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

// Shape for the mask
struct SliceMask: Shape {
    var progress: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: center)
        
        for i in 0..<8 {
            let startAngle = Angle(degrees: Double(i) * 45.0)
            let endAngle = Angle(degrees: Double(i + 1) * 45.0)
            if Double(i) * 45.0 > progress * 360.0 {
                path.addLine(to: center)
            } else {
                path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            }
        }
        
        return path
    }
}

// MARK: - Previews
#Preview {
    SplashView()
}
