//
//  search_view.swift
//  BrainStation23_PracticalTest
//
//  Created by Md. Abdur Rouf on 6/7/22.
//

import Foundation
import SwiftUI

///A Generic search view
struct SearchView: View {
    @Binding var text:String
    
    var body: some View {
        HStack{
            //search icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.theme.primaryText)
            
            //text input field
            TextField("Search by movie title..",text: $text)
                .foregroundColor(Color.theme.primaryText)
                .disableAutocorrection(true)
                .overlay(alignment: .trailing) {
                    //clear button
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.theme.primaryText)
                        .opacity(text.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            text = ""
                            UIApplication.shared.endEditing()
                        }
                }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.controllBackground)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {

            SearchView(text: .constant(""))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        
    }
}
