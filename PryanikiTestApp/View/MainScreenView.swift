//
//  MainScreenView.swift
//  PryanikiTestApp
//
//  Created by Stanislav Lezovsky on 23.08.2022.
//

import UIKit

final class MainScreenView: UIView {
    // MARK: - инициализаторы
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMainView()
    }

    private func setupMainView() {
        backgroundColor = .red
    }
}
