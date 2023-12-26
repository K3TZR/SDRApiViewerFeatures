//
//  NetworkSubView.swift
//  Api6000/SubViews
//
//  Created by Douglas Adams on 10/3/22.
//


import SwiftUI

import FlexApi

public struct NetworkSubView: View {

  @Environment(ApiModel.self) private var api

  public var body: some View {
    
    //    let _ = Self._printChanges()
    
    VStack(alignment: .leading) {
      HeadingView()
      ForEach(api.streamStatus) { status in
        DetailView(status: status)
      }
    }
    .padding(.leading, 40)
  }
}

private struct HeadingView: View {
  
  var body: some View {
    HStack(spacing: 10) {
      Text("NETWORK").frame(width: 80, alignment: .leading)
      Text("Stream").frame(width: 100, alignment: .leading)
      Group {
        Text("Packets")
        Text("Errors")
      }.frame(width: 80, alignment: .trailing)
    }
    Text("")
  }
}

private struct DetailView: View {
  var status: VitaStatus
  
  @State var throttledPackets: Int = 0
    
  var errorPerCent: Float {
    if status.errors == 0 { return 0 }
    return Float(status.errors) / Float(throttledPackets)
  }
  
  var body: some View {
    HStack(spacing: 10) {
      Text(status.type.description()).frame(width: 100, alignment: .leading)
      Group {
        Text(throttledPackets.formatted(.number))
        Text(status.errors.formatted(.number))
        Text(errorPerCent.formatted(.percent.precision(.fractionLength(4))))
      }.frame(width: 80, alignment: .trailing)
    }
    .padding(.leading, 90)
    .onReceive(status.$packets.throttle(for: 1, scheduler: RunLoop.main, latest: true))
    { value in throttledPackets = value }
  }
}

#Preview {
  NetworkSubView()
    .environment(ApiModel.shared)
}
