//
//  RainViewModel.swift
//  RainView
//
//  Created by enigma 1 on 7/10/23.
//

import Foundation
import SwiftUI

class RainViewModel : ObservableObject {
    
    
    var rains = Set<RainModel>()
    
    func update(_ date: Date) {
        
        rains = rains.filter { x in
//            print("xxx")
            return x.removeDate > date
        }
        
        let rain = RainModel(x: Float.random(in: 0..<1),y: Float.random(in: 0..<1), removeDate: Date.now + 1)
        
        rains.insert(rain)
        
        
    }
    
}


struct RainModel : Hashable {
    
    let x: Float
    let y: Float
    let removeDate : Date
}
