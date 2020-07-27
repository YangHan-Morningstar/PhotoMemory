//
//  Drag.swift
//  PhotoMemory
//
//  Created by Tony Young on 2020/7/27.
//  Copyright © 2020 YangHan-Morningstar. All rights reserved.
//

import SwiftUI

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
