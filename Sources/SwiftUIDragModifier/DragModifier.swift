//
//  DragModifier.swift
//  DragGesture
//
//  Created by Alphonso Sensley II on 11/4/21.
//

import SwiftUI

public struct CustomDrag: ViewModifier {
    @State var objectOffset:CGSize = .zero
    
    public func body(content: Content) -> some View {
        //var offSetValue: CGSize = objectOffset
        content
            .offset(objectOffset)
            .gesture(DragGesture()
                        .onChanged { gesture in
                objectOffset = gesture.translation
            }
                        .onEnded { _ in
                objectOffset = objectOffset
            })
    }
}


extension View {
   public func makeDragable(with offset:CGSize) -> some View {
        modifier(CustomDrag(objectOffset: offset))
    }
}
