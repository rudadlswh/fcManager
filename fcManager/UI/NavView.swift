//
//  NavView.swift
//  taxi
//
//  Created by 조경민 on 7/10/24.
//

import SwiftUI

struct NavView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        MainView()
        NavigationView{
            MainView()
                .disabled (self.showMenu ? true : false)
                .navigationBarTitle("fcManager", displayMode: .inline)
                .navigationBarItems (
                    leading:
                        Button (action: {
                            withAnimation {
                                self.showMenu.toggle()
                            }
                        }){
                            Image (systemName: "line.horizontal.3")
                                .foregroundColor (Color.blue)
                                .imageScale(.large)
                        },
                    trailing:
                        Button(action: {
                            print("click trailing")
                        }){
                            Image (systemName: "gearshape")
                                .foregroundColor (Color.blue)
                                .imageScale(.large)
                        }
                )
        }
    }
}
