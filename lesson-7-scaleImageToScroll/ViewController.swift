//
//  ViewController.swift
//  lesson-7-scaleImageToScroll
//
//  Created by Константин Лопаткин on 19.03.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(image: UIImage(named: "image"))
        imageView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 270)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        
        scrollView = UIScrollView()

        scrollView.contentSize = .init(width: UIScreen.main.bounds.width, height: 2000)
        scrollView.delegate = self
        scrollView.clipsToBounds = true
        scrollView.contentInsetAdjustmentBehavior = .never
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(scrollView)
        
        scrollView.frame = .init(x: 0, y: imageView.frame.size.height - 20, width: view.frame.width, height: view.frame.height)
        
        
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            ViewController()
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offset = scrollView.contentOffset
        
        var transformT = CATransform3DTranslate(CATransform3DIdentity, 0, -offset.y, 1)
        if offset.y < 0 {
            scrollView.layer.transform = transformT
        }
        self.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 270 - offset.y)


    }
}
