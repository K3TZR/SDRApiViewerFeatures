//
//  XvtrSubView.swift
//  Api6000/SubViews
//
//  Created by Douglas Adams on 8/5/22.
//


import SwiftUI

import FlexApi

// ----------------------------------------------------------------------------
// MARK: - View

struct XvtrSubView: View {

  @Environment(ApiModel.self) private var api

  var body: some View {
    
    if api.xvtrs.count == 0 {
      HStack(spacing: 20) {
        Text("XVTRs").frame(width: 80, alignment: .leading)
        Text("None present").foregroundColor(.red)
      }
      .padding(.leading, 40)
      
    } else {
      HStack(spacing: 20) {
        Text("XVTR").frame(width: 80, alignment: .leading)
        Text("NOT IMPLEMENTED").foregroundColor(.red)
      }
      .padding(.leading, 40)
    }
  }
}

// ----------------------------------------------------------------------------
// MARK: - Preview

#Preview {
  XvtrSubView()
    .environment(ApiModel.shared)
}
