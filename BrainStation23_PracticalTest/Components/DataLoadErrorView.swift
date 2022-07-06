//
//  DataLoadErrorView.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 7/7/22.
//

import SwiftUI

struct DataLoadErrorView: View {
    var body: some View {
        VStack{
            //Search icom
            Image(systemName: "exclamationmark.icloud")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.theme.hintTextColor)
                .frame(maxHeight: 56)
                .padding()
                
            //Dummy hint text
            Text("Unable to load data!")
                .font(.body)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
}

struct DataLoadErrorView_Previews: PreviewProvider {
    static var previews: some View {
        DataLoadErrorView()
    }
}
