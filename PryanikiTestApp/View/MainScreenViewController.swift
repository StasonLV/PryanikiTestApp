//
//  ViewController.swift
//  PryanikiTestApp
//
//  Created by Stanislav Lezovsky on 23.08.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    // MARK: - константы
    let worker = NetworkWorker()
    let mainView = MainScreenView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        worker.fetch { [weak self] response in
            switch response {
            case .success(let response):
                DispatchQueue.main.async {
                    print(response)
                }
            case .failure(.connectionError):
                print("connect er")
            case .failure(.decodeError):
                print("decode er")
            }
        }
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
