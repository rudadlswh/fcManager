//
//  MainView.swift
//  taxi
//
//  Created by 조경민 on 7/10/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            TabView{
                FirstView()
                    .tabItem{
                        Label("", systemImage: "desktopcomputer")
                    }
                SecondView()
                    .tabItem{
                        Label("", systemImage: "desktopcomputer")
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
