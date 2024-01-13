//
//  ContentView.swift
//  MapARSample
//
//  Created by Hiroki on 2024/01/13.
//

import SwiftUI
import MapKit
struct ContentView: View {
  var body: some View {
    NavigationView{
      Map()
        .toolbar{
          NavigationLink("ナビゲーション"){}
        }
    }
  }
}



struct ContentView_Previews: PreviewProvider{
  static var previews: some View{
    ContentView()
  }
}
