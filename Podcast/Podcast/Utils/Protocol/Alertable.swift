//
//  Alertable.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import UIKit

protocol Alertable {
    func alert(title: String, message: String, prefferedStyle: UIAlertController.Style)
}

extension Alertable where Self: UIViewController {
    func alert(title: String, message: String, prefferedStyle: UIAlertController.Style) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
        let okAction = UIAlertAction(title: "OK", style: .cancel)

        controller.addAction(okAction)
        self.present(controller, animated: true)
    }
}
