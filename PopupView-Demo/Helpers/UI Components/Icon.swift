//
//  Icon.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//

import SwiftUI

struct Icon: View {
    private let image: ImageResource
    private let size: CGFloat?
    private let color: Color?
    
    init(_ image: ImageResource, size: CGFloat? = nil, color: Color? = nil) {
        self.image = image
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(color ?? .clear)
    }
}
