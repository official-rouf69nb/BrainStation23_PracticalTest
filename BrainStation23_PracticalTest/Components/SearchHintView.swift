//
//  SearchHintView.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 7/7/22.
//

import SwiftUI

struct SearchHintView: View {
    var body: some View {
        VStack{
            //Search icom
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.theme.hintTextColor)
                .frame(maxHeight: 56)
                .padding()
                
            //Dummy hint text
            Text("Search your favorite movies!")
                .font(.body)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
}

struct SearchHintView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHintView()
    }
}
