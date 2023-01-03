//
//  LoaderHUD.swift
//  SpaceX
//
//  Created by MohammadBarek on 2023-01-03.
//

import UIKit
import Lottie

class LoaderHUD: UIView {

    weak var presentingViewController: UIViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        presentingViewController = nil
        configureView()
    }

    convenience init(frame: CGRect, viewController: UIViewController) {
        self.init(frame: frame)
        presentingViewController = viewController
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        presentingViewController = nil
        configureView()
    }
}

// MARK: - Private helper methods
private extension LoaderHUD {
    func configureView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)

        let animation = Animation.named("loader-animation")
        let animationView = AnimationView(animation: animation)
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animationView)
        animationView.play()

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalToConstant: 180),
            animationView.widthAnchor.constraint(equalToConstant: 180),
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}
