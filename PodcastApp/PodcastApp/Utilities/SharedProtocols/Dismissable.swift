//
//  Dismissable.swift
//  PodcastApp
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
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
