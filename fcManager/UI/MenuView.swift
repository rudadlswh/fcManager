//
//  MenuView.swift
//  taxi
//
//  Created by 조경민 on 7/10/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading) {
                Divider()
                    .background(Color(.white))
                    .padding (.top, 100)
                Image (systemName: "person" )
                    .foregroundColor(.white)
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .font (.headline)
                    . padding(.leading, 10)
                Divider ().background (Color(.white))
                HStack {
                    Image (systemName: "envelope")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text ("Messages")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.leading, 10)
                    Divider().background(Color(.white))
                    HStack {
                        Image (systemName: "gear")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text ("Profile")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.leading, 10)
                        Divider().background(Color(.white))
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    MenuView()
}
