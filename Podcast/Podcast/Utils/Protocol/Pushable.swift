//
//  Pushable.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
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
