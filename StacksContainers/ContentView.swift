//
//  ContentView.swift
//  StacksContainers
//
//  Created by Alex on 17/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State var align: HorizontalAlignment = .center
    var body: some View {
        TabView {
            ZstackView()
                .tabItem {
                VStack {
                    Image(systemName: "1.circle")
                    Text("ZStack")
                }
            }
            
            VStack(spacing: 50) {
                ColorVStackView(align: $align)
                
                Divider()
                HStack(spacing: 50){
                    Button("Leading") {
                        withAnimation {
                            self.align = .leading
                        }
                    }
                    
                    Button("Center") {
                        withAnimation {
                            self.align = .center
                        }
                    }
                    
                    Button("Trailing") {
                        withAnimation {
                            self.align = .trailing
                        }
                    }
                }
            }.tabItem {
                Image(systemName: "2.circle")
                Text("VStack / HStack")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ZstackView: View {
    var body: some View {
        ZStack {
            Color.blue
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 300, height: 300)
            
            Circle().fill(Color.red)
                .frame(width: 150, height: 150)
            
            Text("ZStack").font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct ColorVStackView: View {
    
    @Binding var align: HorizontalAlignment
    var body: some View {
        VStack(alignment: align, spacing: 20) {
            RoundedRectangle(cornerRadius: 10).fill(.red).frame(width: 70, height: 30)
            
            RoundedRectangle(cornerRadius: 10).fill(.green).frame(width: 140, height: 30)
            
            RoundedRectangle(cornerRadius: 10).fill(.blue).frame(width: 90, height: 30)
        }
    }
}
