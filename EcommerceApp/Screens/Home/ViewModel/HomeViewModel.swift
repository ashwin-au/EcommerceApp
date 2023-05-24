//
//  HomeViewModel.swift
//  EcommerceApp
//
//  Created by Ashwin A U on 17/05/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var imageArray = [
        ImageModel(index: 0, image: Image.banner),
        ImageModel(index: 1, image: Image.banner),
        ImageModel(index: 2, image: Image.banner),
        ImageModel(index: 3, image: Image.banner)
    ]
    @Published var searchText: String = ""
    @Published var showSearch = false
    var backgroundColor: Color {
        return showSearch == true ? .secondaryBackground : .primaryWhite
    }
}
