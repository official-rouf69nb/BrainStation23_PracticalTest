//
//  EmptyListErrorView.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 7/7/22.
//

import SwiftUI

struct EmptyListErrorView: View {
    var body: some View {
        VStack{
            //Search icom
            Image(systemName: "doc.text.magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.theme.hintTextColor)
                .frame(maxHeight: 56)
                .padding()
                
            //Dummy hint text
            Text("No movies found!")
                .font(.body)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
}

struct EmptyListErrorView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListErrorView()
    }
}
