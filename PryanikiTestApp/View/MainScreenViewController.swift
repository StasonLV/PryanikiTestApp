//
//  ViewController.swift
//  PryanikiTestApp
//
//  Created by Stanislav Lezovsky on 23.08.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    // MARK: - константы
    let mainView = MainScreenView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
    }

    override func viewWillLayoutSubviews() {
        mainView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: view.frame.size.height
        )
    }
}
