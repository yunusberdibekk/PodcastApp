//
//  Pushable.swift
//  PodcastApp
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import UIKit

protocol Pushable {
    func push(controller: UIViewController)
}

extension Pushable where Self: UIViewController {
    func push(controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
