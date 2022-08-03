//
//  ScreenProperties.swift
//  aafafa
//
//  Created by Mun Heng Ow on 01/08/2022.
//

import SwiftUI

// https://youtu.be/as0WdBhMDUY?t=162
struct ScreenProperties<Content: View>: View {
  var content: (Properties) -> Content
  var body: some View {
    GeometryReader{proxy in
      let size = proxy.size
      let isLandscape = (size.width > size.height)
      let isiPad = UIDevice.current.userInterfaceIdiom == .pad
      
      content(Properties(isLandscape: isLandscape, isiPad: isiPad, size: size, isSplitView: isSplitView()))
        .frame(width: size.width, height: size.height, alignment: .center)
    }
  }
}

func isSplitView() -> Bool {
  guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
    return false
  }
  return screen.windows.first?.frame.size != UIScreen.main.bounds.size
}

struct Properties {
  var isLandscape: Bool
  var isiPad: Bool
  var size: CGSize
  var isSplitView: Bool  
}
