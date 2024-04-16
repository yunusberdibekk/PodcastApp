//
//  Dismissable.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import UIKit

protocol Dismissable {
    func dismiss()
}

extension Dismissable where Self: UIViewController {
    func dismiss() {
        self.dismiss(animated: true)
    }
}
