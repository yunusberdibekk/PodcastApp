//
//  SFSymbol.swift
//  PodcastApp
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import Foundation

enum SFSymbol: String {
    case list_clipboard
    case heart
    case magnifyingglass
    case magnifyingglass_circle
    case music_note_house
    case play

    var systemName: String {
        self.rawValue.replacing("_", with: ".")
    }

    var fill: String {
        self.rawValue.replacing("_", with: ".").appending(".fill")
    }
}
