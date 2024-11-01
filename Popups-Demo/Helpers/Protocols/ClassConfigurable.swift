//
//  ClassConfigurable.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 01.11.2024.
//

import Foundation

protocol ClassConfigurable {
    associatedtype C
}

extension ClassConfigurable {
    @discardableResult func configure<T>(path: ReferenceWritableKeyPath<C, T>, _ value: T) -> Self {
        guard let `self` = self as? Self.C else { return self }
        `self`[keyPath: path] = value
        return self as! Self
    }
}

extension ClassConfigurable {
    typealias C = Self
}
