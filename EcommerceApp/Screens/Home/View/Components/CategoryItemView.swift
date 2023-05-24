//
//  CategoryItemView.swift
//  EcommerceApp
//
//  Created by Ashwin A U on 17/05/23.
//

import SwiftUI

struct CategoryItemView: View {
    var image: Image
    var title: String
    var fillColor: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .frame(width: 90, height: 90)
                .foregroundColor(fillColor)
            VStack(alignment: .center, spacing: 15){
                image
                Text(title)
                    .font(.caption)
                    .foregroundColor(.primaryWhite)
                
            }
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(image: Image.veg, title: "Veg", fillColor: .appGreen)
    }
}
