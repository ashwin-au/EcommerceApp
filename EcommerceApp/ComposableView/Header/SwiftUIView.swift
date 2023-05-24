//
//  SwiftUIView.swift
//  EcommerceApp
//
//  Created by Ashwin A U on 17/05/23.
//

import SwiftUI

struct HeaderView<Content: View>: View {
    var title: String
    var content: Content
    var onTap: () -> Void
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title2.bold())
                Spacer()
                Button(action: { onTap() }, label: {
                    Image(systemName: "chevron.right")
                })
            }
            content
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", content: Text("nothing")
                   , onTap: { })
    }
}
