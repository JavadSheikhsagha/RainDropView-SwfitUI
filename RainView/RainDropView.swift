//
//  ContentView.swift
//  RainView
//
//  Created by enigma 1 on 7/10/23.
//

import SwiftUI

struct RainDropView: View {
    
    @StateObject var viewModel : RainViewModel = RainViewModel()
    
    var body: some View {
        TimelineView(.animation) { timeline in
            
            Canvas { context, size in
                
                
                viewModel.update(timeline.date)
                
                for i in viewModel.rains {
                    let age = timeline.date.distance(to: i.removeDate)
//                    context.draw(.init("cac1"), at: CGPoint(x: Double(i.x) * size.width, y: Double(i.y - 0.11) * size.height))
                    let rect = CGRect(x: CGFloat(i.x) * size.width,
                                      y: size.height - (size.height * age * 1.0),
                                      width: 5,
                                      height: 20)
                    
                    
                    context.fill(RaindDropShape(startAngle: .zero,
                                                endAngle: .degrees(180),
                                                clockwise: false).path(in: rect),
                                 with: .color(.white))
                }
                
            }
            
        }.ignoresSafeArea()
            .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RainDropView()
    }
}


struct RaindDropShape: Shape {
    
    var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        

        return path
    }
}
