//
//  ViewController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import PodcastAPI
import UIKit

final class PodcastListViewController: UIViewController {
    var service: APIClientProtocol = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Podcasts"

        let url = URL(string: "https://rss.applemarketingtools.com/api/v2/tr/podcasts/top/50/podcasts.json")!

        service.execute(expecting: PodcastResponse.self, request: .init(url: url)) { result in
            switch result {
            case .success(let object):
                dump(object)
            case .failure(let error):
                dump(error)
            }
        }
    }
}
