//
//  ViewController.swift
//  Splash
//
//  Created by Takeru Sato on 2019/02/06.
//  Copyright © 2019 son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var splashView: SplashView!

    override func viewDidLoad() {
        super.viewDidLoad()
        splashView = SplashView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        splashView.set(image: UIImage(named: "Github")!, size: CGSize(width: 60, height: 60))
        view.addSubview(splashView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        splashView.executeAnimation {
            self.splashView.removeFromSuperview()
        }
    }
}

final class SplashView: UIView {
    
    private var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    func set(image: UIImage, size: CGSize) {
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        imageView.image = image
        imageView.center = center
        addSubview(imageView)
    }
    
    func executeAnimation(completion: @escaping() -> Void) {
        UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveEaseOut, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        })
        
        UIView.animate(withDuration: 0.5, delay: 1.3, options: .curveEaseOut, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.imageView.alpha = 0
            }, completion: { _ in
                completion()
            })
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
