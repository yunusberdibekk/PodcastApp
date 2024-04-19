//
//  Loadable.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 20.04.2024.
//

import UIKit

protocol Loadable {
    func loadable(_ bool: Bool)
}

extension Loadable where Self: LoadableViewController {
    func loadable(_ bool: Bool) {
        DispatchQueue.main.async {
            if bool {
                self.startAnimating()
            } else {
                self.stopAnimating()
            }
        }
    }
}
