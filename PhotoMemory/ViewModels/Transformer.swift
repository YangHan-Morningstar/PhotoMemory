//
//  Transformer.swift
//  PhotoMemory
//
//  Created by Tony Young on 2020/7/27.
//  Copyright © 2020 YangHan-Morningstar. All rights reserved.
//

import SwiftUI

class Transformer: ObservableObject {
    
    var itemSpacing: CGFloat = 60
    var stackItemHeight: CGFloat = 170
    var firstAnimationDuration: Double = 0.3
    
    func getRotation(stackIndex:Int, itemIndex: Int, expandStack: Int?) -> Double {
        if stackIndex == expandStack {
            return 0
        }
        
        return Double.random(in: -10...10)
    }
    
    
    func getStackVerticalOffset(stackIndex: Int, expandStack: Int?) -> CGFloat {
        if expandStack == nil {
            return CGFloat(stackIndex) * (itemSpacing + stackItemHeight)
        } else {
            return 0
        }
    }
    
    func getCardVerticalOffset(stackIndex: Int, itemIndex: Int, expandStack: Int?) -> CGFloat {
        if expandStack == stackIndex {
            return CGFloat(itemIndex) * (itemSpacing + stackItemHeight)
        } else {
            return 0
        }
    }
}
