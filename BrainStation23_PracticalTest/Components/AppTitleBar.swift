//
//  AppTitleBar.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 7/7/22.
//

import SwiftUI

struct AppTitleBar: View {
    let title:String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AppTitleBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleBar(title: "Movie List")
    }
}
