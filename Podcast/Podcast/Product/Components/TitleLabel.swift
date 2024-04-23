//
//  TitleLabel.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 22.04.2024.
//

import UIKit

final class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(text: String,
                     textColor: UIColor = .label,
                     textAlignment: NSTextAlignment = .left,
                     font: UIFont = UIFont.systemFont(ofSize: 18, weight: .semibold),
                     numberOfLines: Int = 1)
    {
        self.init(frame: .zero)

        self.prepareLabel(text: text,
                          textColor: textColor,
                          textAlignment: textAlignment,
                          font: font,
                          numberOfLines: numberOfLines)
    }

    private func prepareLabel(text: String,
                              textColor: UIColor,
                              textAlignment: NSTextAlignment,
                              font: UIFont,
                              numberOfLines: Int)
    {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = .byTruncatingTail
    }
}
