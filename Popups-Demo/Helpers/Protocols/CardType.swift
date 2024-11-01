//
//  CardType.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

protocol CardType {
    var imageNamePrefix: String { get }
    var tags: [Tag] { get }
    var title: String { get }
    var description: String { get }
}

extension CardType {
    var image: Image { .init(imageName) }
}

private extension CardType {
    var imageName: String { imageNamePrefix + .init(describing: self).camelCaseToKebabCase() }
}
