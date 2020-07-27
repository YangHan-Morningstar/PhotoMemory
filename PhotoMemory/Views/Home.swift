//
//  Home.swift
//  PhotoMemory
//
//  Created by Tony Young on 2020/7/27.
//  Copyright © 2020 YangHan-Morningstar. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var expandStack: Int? = nil
    
    @ObservedObject var transformer = Transformer()
    @ObservedObject var dataViewModel = DataViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                HStack {
                    Text("Wlop图片记忆")
                        .font(.system(size: 40, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                ZStack {
                    ForEach(0..<self.dataViewModel.itemStacks.count) {i in
                        VStack {
                            Spacer()
                                .frame(height: 30)
                            
                            Spacer()
                                .frame(height: self.transformer.getStackVerticalOffset(stackIndex: i, expandStack: self.expandStack))
                            
                            ZStack {
                                ForEach(0..<self.dataViewModel.itemStacks[i].count) {j in
                                    VStack {
                                        Spacer()
                                            .frame(height: self.transformer.getCardVerticalOffset(stackIndex: i, itemIndex: j, expandStack: self.expandStack))
                                        
                                        Image(self.dataViewModel.itemStacks[i][j].imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxHeight: self.transformer.stackItemHeight)
                                            .clipped()
                                            .offset(x: CGFloat.random(in: -3...3), y: CGFloat.random(in: -3...3))
                                            .overlay(Rectangle().stroke(lineWidth: 8).foregroundColor(.white))
                                            .shadow(color: Color.black.opacity(0.2), radius: 3 )
                                            .rotationEffect(Angle(degrees: self.transformer.getRotation(stackIndex: i, itemIndex: j, expandStack: self.expandStack)))
                                        
                                        Spacer()
                                    }
                                }
                            }
                            .onTapGesture {
                                if self.expandStack == nil {
                                    self.expandStack = i
                                }
                            }
                            
                            Spacer()
                        }
                        .opacity((self.expandStack == i || self.expandStack == nil) ? 1: 0)
                        .animation(Animation.easeInOut(duration: self.transformer.firstAnimationDuration))
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width)
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    if self.expandStack != nil {
                        Button(action: { self.expandStack = nil }) {
                            Image(systemName: "xmark")
                                .frame(width: 36, height:36)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
