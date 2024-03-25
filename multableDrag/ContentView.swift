//
//  ContentView.swift
//  multableDrag
//
//  Created by andyhaz on 3/23/24.
//

import SwiftUI

struct DraggableShape: View, Identifiable {
  let id = UUID() // Unique identifier for each shape
  let color: Color
  let size: CGSize // Size of the shape
  @State private var offset: CGSize = .zero // Stores drag offset
  @State private var isDragging = true
  @State private var postion:CGSize = .zero
    
  var body: some View {
      RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
          .frame(width: 100, height: 100)
          .offset(postion)
          .foregroundColor(color)
          .gesture(
          DragGesture()
              .onChanged({ value in
                  postion = value.translation
                  isDragging = true
              })
              .onEnded({ vaule in
                  postion = vaule.translation
                  isDragging = false
                 // Text("\(tag)")
              }))
  }

  private func calculatePosition() -> CGPoint {
    // Implement logic to calculate final position based on size, offset, and potential boundary checks
    return CGPoint(x: 100, y: 100) // Example initial position
  }
}


struct DraggableShapeView: View {
    @State private var shapes: [DraggableShape] = [
        DraggableShape(color: .red, size: CGSize(width: 50, height: 50)),
        DraggableShape(color: .blue, size: CGSize(width: 50, height: 50))
    // Add more shapes here
  ]

  var body: some View {
      ZStack {
        ForEach(shapes) { shape in
            DraggableShape(color: shape.color, size: shape.size)
        }
      }
      .frame(width: 400,height: 400)
  }
}

#Preview {
    DraggableShapeView()
}
