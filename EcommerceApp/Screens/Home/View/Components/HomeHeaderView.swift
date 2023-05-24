//
//  HomeHeaderView.swift
//  EcommerceApp
//
//  Created by Ashwin A U on 16/05/23.
//

import SwiftUI

struct HomeHeaderView: View {
    @State var language: Language = .english
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image("icon")
                Spacer()
                navLeftItems
            }
            location
            Spacer()
           
        }
    }

    // View Variable
    var navLeftItems: some View {
        HStack {
            languagePicker
            Button(action: { }, label: {
                Image("bell")
            })
        }
    }

    var languagePicker: some View {
        HStack {
            Picker("Language", selection: $language) {
                ForEach(Language.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.menu)
        }
    }
    
    var location: some View {
        HStack(alignment: .center, spacing: 10) {
            Image("location")
            VStack(alignment: .leading, spacing: 5) {
                Text("Bengaluru")
                    .font(.caption)
                    .foregroundColor(.primaryFont)
                Text("BTM Layout, 500628")
                    .font(.callout)
                    .foregroundColor(.primaryFont)
            }
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "chevron.right")
                    
            }).tint(.black)
        }
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}

enum Language: String, CaseIterable {
    case english = "Eng"
    case spanish = "Esp"
    case arabic = "Arb"
}
