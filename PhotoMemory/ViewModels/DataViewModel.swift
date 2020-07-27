//
//  DataViewModel.swift
//  PhotoMemory
//
//  Created by Tony Young on 2020/7/27.
//  Copyright © 2020 YangHan-Morningstar. All rights reserved.
//

import Foundation

class DataViewModel: ObservableObject {
    @Published var itemStacks: [[StackableItem]]
    
    init() {
        itemStacks = [
            [
                StackableItem(imageName: "hai1"),
                StackableItem(imageName: "hai2"),
                StackableItem(imageName: "hai3")
            ],
            [
                StackableItem(imageName: "feng1"),
                StackableItem(imageName: "feng2"),
                StackableItem(imageName: "feng3")
            ],
            [
                StackableItem(imageName: "gui1"),
                StackableItem(imageName: "gui2"),
                StackableItem(imageName: "gui3"),
                StackableItem(imageName: "gui4")
            ]
        ]
    }
    
    
}
