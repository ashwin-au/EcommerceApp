//
//  HomeScreen.swift
//  EcommerceApp
//
//  Created by Ashwin A U on 16/05/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    if !viewModel.showSearch {
                        HomeHeaderView()
                    }
                    SearchField(onTapSearch: $viewModel.showSearch, text: $viewModel.searchText)
                    if !viewModel.showSearch {
                        ImageCarouselView(images: $viewModel.imageArray)

                        HeaderView(title: "Categories", content: categories) { }
                            .padding(.top, 20)

                        HeaderView(title: "New Arrivals", content: newArrivals) { }
                            .padding(.top, 20)
                    }

                }.padding(.horizontal, 20)
            }.background(viewModel.backgroundColor)
        }
    }

    var categories: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 8, id: \.self) { _ in
                    CategoryItemView(image: Image.veg, title: "Groceries", fillColor: .appGreen)
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        }.padding(.horizontal, -20)
    }

    var newArrivals: some View {
        ImageCarouselView(images: $viewModel.imageArray)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
