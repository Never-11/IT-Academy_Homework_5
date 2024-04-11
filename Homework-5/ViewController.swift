//
//  ViewController.swift
//  Homework-5
//
//  Created by Андрей Неверовский on 4.04.24.
//

import UIKit

/// Экран 1. Запуск  приложение

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let circle = UIView()
    
    //MARK: - Lifecycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        
        print("Hello world")
    }
    
    //MARK: - Flow Functions
    
    func randomColor() -> UIColor {
            return UIColor(red: .random(in: 0...1),
                           green: .random(in: 0...1),
                           blue: .random(in: 0...1),
                           alpha: 1.0)
        }
    
    func createView() {
        circle.frame =  CGRect(x: 50, y: 50, width: 100, height: 100)
        circle.layer.cornerRadius = 50
        circle.backgroundColor = .black
        view.addSubview(circle)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        circle.addGestureRecognizer(recognizer)
    }
    
    @objc func tapDetected() {
  
//        let randomWidth = CGFloat(arc4random_uniform(UInt32(UInt(self.view.frame.width))))
//        let randomHeight = CGFloat(arc4random_uniform(UInt32(UInt(self.view.frame.height))))
        
//        circle.center = CGPoint(x: randomWidth, y: randomHeight)
        circle.backgroundColor = randomColor()
        
        circle.frame.origin.x = positionRandom().0
        circle.frame.origin.y = positionRandom().1
        
        }
    
    func positionRandom() -> (Double, Double) {
        let randomWidthOne = Double.random(in: view.frame.minX..<(view.frame.maxX - circle.frame.size.width))
        let randomHeightOne = Double.random(in: (view.frame.minY + view.safeAreaInsets.top)..<(view.frame.maxY - view.safeAreaInsets.bottom - circle.frame.size.height))
        return (randomWidthOne, randomHeightOne)
    }
    
    
    
}
