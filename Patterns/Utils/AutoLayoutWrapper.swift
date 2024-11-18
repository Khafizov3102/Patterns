//
//  AutoLayoutWrapper.swift
//  BadgesTutorial
//
//  Created by Alexander Korchak on 14.11.2023.
//


import class UIKit.UIView

// This super important property wrapper helps to 
// avoid writing the thing you often forget to write:
// .translatesAutoresizingMaskIntoConstraints = false
// Just put @AutolayoutUsage in front of the view you want to
// layout using AutoLayout
@propertyWrapper
public struct AutoLayoutUsage<T: UIView> {
    public var wrappedValue: T {
        didSet {
            setTranslatesAutoresizingMaskIntoConstraints()
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setTranslatesAutoresizingMaskIntoConstraints()
    }

    private func setTranslatesAutoresizingMaskIntoConstraints() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
