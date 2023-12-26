//
//  StreamSubView.swift
//  Api6000/SubViews
//
//  Created by Douglas Adams on 1/23/22.
//


import SwiftUI

import FlexApi
import SharedModel

// ----------------------------------------------------------------------------
// MARK: - View

struct StreamSubView: View {
  let handle: UInt32

  @Environment(ApiModel.self) private var api

  var body: some View {
    Grid(alignment: .leading, horizontalSpacing: 10) {
      // Meter
//      MeterStreamView()
      
      // Panadapter
      ForEach(api.panadapters) { panadapter in
        if handle == panadapter.clientHandle { PanadapterStreamView(panadapter: panadapter) }
      }
      
      // Waterfall
      ForEach(api.waterfalls) { waterfall in
        if handle == waterfall.clientHandle { WaterfallStreamView(waterfall: waterfall) }
      }
      
      // RemoteRxAudioStream
      ForEach(api.remoteRxAudioStreams) { stream in
        if handle == stream.clientHandle { RemoteRxStreamView(stream: stream) }
      }
      
      // RemoteTxAudioStream
      ForEach(api.remoteTxAudioStreams) { stream in
        if handle == stream.clientHandle { RemoteTxStreamView(stream: stream) }
      }
      
      // DaxMicAudioStream
      ForEach(api.daxMicAudioStreams) { stream in
        if handle == stream.clientHandle { DaxMicStreamView(stream: stream) }
      }
      
      // DaxRxAudioStream
      ForEach(api.daxRxAudioStreams) { stream in
        if handle == stream.clientHandle { DaxRxStreamView(stream: stream) }
      }
      
      // DaxTxAudioStream
      ForEach(api.daxTxAudioStreams) { stream in
        if handle == stream.clientHandle { DaxTxStreamView(stream: stream) }
      }
      
      // DaxIqStream
      ForEach(api.daxIqStreams) { stream in
        if handle == stream.clientHandle { DaxIqStreamView(stream: stream) }
      }
    }
    .padding(.leading, 20)
  }
}

//private struct MeterStreamView: View {
//  var streamModel: StreamModel
//  
//  var body: some View {
//    
//    GridRow {
//      Group {
//        Text("METER")
//        Text(streamModel.meterStream == nil ? "0x--------" : streamModel.meterStream!.id.hex ).foregroundColor(.green)
//        HStack(spacing: 5) {
//          Text("Streaming")
//          Text(streamModel.meterStream == nil ? "N" : "Y").foregroundColor(streamModel.meterStream == nil ? .red : .green)
//        }
//      }.frame(width: 100, alignment: .leading)
//    }
//  }
//}

private struct PanadapterStreamView: View {
  var panadapter: Panadapter
  
  var body: some View {
    
    GridRow {
      Group {
        Text("PANADAPTER")
        Text(panadapter.isStreaming ? panadapter.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(panadapter.isStreaming ? "Y" : "N").foregroundColor(panadapter.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
    }
  }
}

private struct WaterfallStreamView: View {
  var waterfall: Waterfall
  
  var body: some View {
    
    GridRow {
      Group {
        Text("WATERFALL")
        Text(waterfall.isStreaming ? waterfall.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(waterfall.isStreaming ? "Y" : "N").foregroundColor(waterfall.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
    }
  }
}

private struct RemoteRxStreamView: View {
  var stream: RemoteRxAudioStream
  
  var body: some View {
    
    GridRow {
      Group {
        Text("REMOTE Rx")
        Text(stream.isStreaming ? stream.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(stream.isStreaming ? "Y" : "N").foregroundColor(stream.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
      Group {
        HStack(spacing: 5) {
          Text("Handle")
          Text("\(stream.clientHandle.hex)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Compression")
          Text("\(stream.compression)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Ip")
          Text("\(stream.ip)").foregroundColor(.green)
        }
      }.frame(width: 120, alignment: .leading)
    }
  }
}

private struct RemoteTxStreamView: View {
  var stream: RemoteTxAudioStream
  
  var body: some View {
    
    GridRow {
      Group {
        Text("REMOTE Tx")
        Text(stream.isStreaming ? stream.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(stream.isStreaming ? "Y" : "N").foregroundColor(stream.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
      Group {
        HStack(spacing: 5) {
          Text("Handle")
          Text("\(stream.clientHandle.hex)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Compression")
          Text("\(stream.compression)").foregroundColor(.green)
        }
      }.frame(width: 120, alignment: .leading)
    }
  }
}

private struct DaxMicStreamView: View {
  var stream: DaxMicAudioStream
  
  var body: some View {
    
    GridRow {
      Group {
        Text("DAX Mic").frame(width: 80, alignment: .leading)
        Text(stream.isStreaming ? stream.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(stream.isStreaming ? "Y" : "N").foregroundColor(stream.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
      Group {
        HStack(spacing: 5) {
          Text("Handle")
          Text("\(stream.clientHandle.hex)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Ip")
          Text("\(stream.ip)").foregroundColor(.green)
        }
      }.frame(width: 120, alignment: .leading)
    }
  }
}

private struct DaxRxStreamView: View {
  var stream: DaxRxAudioStream
  
  var body: some View {
    
    GridRow {
      Group {
        Text("DAX Rx").frame(width: 80, alignment: .leading)
        Text(stream.isStreaming ? stream.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(stream.isStreaming ? "Y" : "N").foregroundColor(stream.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
      Group {
        HStack(spacing: 5) {
          Text("Handle")
          Text("\(stream.clientHandle.hex)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Channel")
          Text("\(stream.daxChannel)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Ip")
          Text("\(stream.ip)").foregroundColor(.green)
        }
      }.frame(width: 120, alignment: .leading)
    }
  }
}

private struct DaxTxStreamView: View {
  var stream: DaxTxAudioStream
  
  var body: some View {
    
    GridRow {
      Group {
        Text("DAX Tx").frame(width: 80, alignment: .leading)
        Text(stream.isStreaming ? stream.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(stream.isStreaming ? "Y" : "N").foregroundColor(stream.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
      Group {
        HStack(spacing: 5) {
          Text("Handle")
          Text("\(stream.clientHandle.hex)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Ip")
          Text("\(stream.ip)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Transmit")
          Text("\(stream.isTransmitChannel ? "Y" : "N")").foregroundColor(stream.isTransmitChannel ? .green : .red)
        }
      }.frame(width: 120, alignment: .leading)
    }
  }
}

private struct DaxIqStreamView: View {
  var stream: DaxIqStream
  
  var body: some View {
    
    GridRow {
      Group {
        Text("DAX IQ").frame(width: 80, alignment: .leading)
        Text(stream.isStreaming ? stream.id.hex : "0x--------").foregroundColor(.green)
        HStack(spacing: 5) {
          Text("Streaming")
          Text(stream.isStreaming ? "Y" : "N").foregroundColor(stream.isStreaming ? .green : .red)
        }
      }.frame(width: 100, alignment: .leading)
      Group {
        HStack(spacing: 5) {
          Text("Handle")
          Text("\(stream.clientHandle.hex)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Ip")
          Text("\(stream.ip)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Channel")
          Text("\(stream.channel)").foregroundColor(.green)
        }
        HStack(spacing: 5) {
          Text("Pan")
          Text(stream.pan.hex).foregroundColor(.green)
        }
      }.frame(width: 120, alignment: .leading)
    }
  }
}

// ----------------------------------------------------------------------------
// MARK: - Preview

#Preview {
  StreamSubView(handle: 1)
}
