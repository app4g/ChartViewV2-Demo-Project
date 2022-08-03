//
//  RingView.swift
// 
//
//  Created by Mun Heng Ow on 28/07/2022.
//

import SwiftUI

// https://sarunw.com/posts/swiftui-circular-progress-bar/
@available(iOS 13.0, *)

public enum RingSizeType {
  case tiny
  case small
  case medium
  case large
}

struct RingView: View {
  @State var compliancePct: Double
  
  var lineWidth: CGFloat = 5
  var primaryColor: Color = Color.orange
  var secondaryColor: Color = Color.orange
  var size: RingSizeType = .medium
  
  var checkMarkSize: (width: CGFloat, height: CGFloat) {
    switch size {
    case .tiny, .small:
      return (10.0, 10.0)
    case .medium:
      return (30.0, 30.0)
    case .large:
      return (35.0, 35.0)
    }
  }
 
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(secondaryColor.opacity(0.2), lineWidth: lineWidth)
      
      ringContent(compliancePct: compliancePct, size: size, checkMarkSize: (checkMarkSize.width, checkMarkSize.height))
      
      Circle()
        .trim(from: 0, to: compliancePct)
        .stroke(compliancePct >= 1 ? Color.green : primaryColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
        .rotationEffect(.degrees(-90))
        .animation(.easeOut, value: compliancePct)
    }
  }
}

struct ringContent: View {
  @State var compliancePct: Double
  @State var size: RingSizeType
  @State var checkMarkSize: (width: CGFloat, height: CGFloat)
  
  var body: some View {
    
    if compliancePct < 1 {
      if (size != RingSizeType.tiny && size != RingSizeType.small) {
        Text(String(Int(compliancePct*100)))
        +
        Text("%")
          .font(.caption)
      }
    } else if compliancePct > 1 {
      if (size == RingSizeType.tiny || size == RingSizeType.small) {
        Image(systemName: "checkmark")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .foregroundColor(Color.green)
          .frame(width: checkMarkSize.width, height: checkMarkSize.height)
      } else {
        Text(String(Int(compliancePct*100)))
        +
        Text("%")
          .font(.caption)
      }
    }

  }
}
