//
//  Configurable.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//

import Foundation

protocol Configurable { }

extension Configurable {
    func configure<T>(path: WritableKeyPath<Self, T>, _ value: T) -> Self {
        var copy = self
        copy[keyPath: path] = value
        return copy
    }
}
