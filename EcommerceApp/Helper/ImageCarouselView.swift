//
//  ImageCarouselView.swift
//  EcommerceApp
//
//  Created by Ashwin A U on 16/05/23.
//

import SwiftUI

struct ImageCarouselView: View {
    @Binding var images: [ImageModel]
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        
        ZStack {
            ForEach(images, id: \.id) { item in
                
                // article view
                ZStack {
                    item.image
                }
                .frame(width: 200, height: 200)
                .scaleEffect(1.0 - abs(distance(item.index)) * 0.2 )
                .opacity(1.0 - abs(distance(item.index)) * 0.3 )
                .offset(x: myXOffset(item.index), y: 0)
                .zIndex(1.0 - abs(distance(item.index)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(images.count))
                        snappedItem = draggingItem
                    }
                }
        )
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(images.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(images.count) * distance(item)
        return sin(angle) * 200
    }
    
}


struct ImageCarouselView_Previews: PreviewProvider {
    static let imageArray = [ ImageModel(index: 0, image: Image.banner),
               ImageModel(index: 1, image: Image.banner),
               ImageModel(index: 2, image: Image.banner),
               ImageModel(index: 3, image: Image.banner)
           ]
    static var previews: some View {
        ImageCarouselView(images: .constant(imageArray))
    }
}

struct ImageModel: Identifiable {
    var id = UUID()
    var index: Int
    var image: Image
}
