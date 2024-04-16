//
//  Presentable.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import UIKit

protocol Presentable {
    func present(controlller: UIViewController)
}

extension Presentable where Self: UIViewController {
    func present(controlller: UIViewController) {
        self.present(controlller, animated: true)
    }
}
