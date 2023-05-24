//
//  SearchField.swift
//  EcommerceApp
//
//  Created by Ashwin A U on 16/05/23.
//

import SwiftUI

struct SearchField: View {
    @Binding var onTapSearch: Bool
    @Binding var text: String
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if !onTapSearch {
                SearchText()
                    .matchedGeometryEffect(id: "search", in: namespace)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                            onTapSearch.toggle()
                        }
                    }
            } else {
                SearchBarExpand(close: $onTapSearch, namespace: namespace, text: $text)
                    .matchedGeometryEffect(id: "search", in: namespace)
            }
        }
    }
}

struct SearchText: View {
    var backgroundColor: Color = .secondaryBackground
    var body: some View {
        CardView(backgroundColor: backgroundColor, padding: 15, stroke: .clear) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.secondary)
                Text("Search Anything...")
                    .font(.callout)
                    .foregroundColor(.secondary)
                Spacer()

                Divider()
                    .frame(height: 20)
                    .padding(.trailing, 10)

                Button(action: {}, label: {
                    Image("mic")
                })
            }
        }.cornerRadius(12)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(onTapSearch: .constant(true), text: .constant("Search Anything..."))
    }
}

struct SearchBarExpand: View {
    @Binding var close: Bool
    var namespace: Namespace.ID
    @Binding var text: String
    var body: some View {
        VStack {
            CardView(backgroundColor: .white, padding: 15, stroke: .clear) {
                HStack(alignment: .center, spacing: 10) {
                  TextField(text: $text, label: {
                      Image(systemName: "magnifyingglass")
                          .resizable()
                          .frame(width: 24, height: 24)
                          .foregroundColor(.secondary)
                      Text("Search Anything...")
                          .font(.callout)
                          .foregroundColor(.secondary)
                  })
                    Spacer()

                    Divider()
                        .frame(height: 20)
                        .padding(.trailing, 10)

                    Button(action: {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                            close.toggle()
                        }
                    }, label: {
                        Image(systemName: "multiply")
                    }).tint(.black)
                }
            }.cornerRadius(12)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondaryBackground)
    }
}
