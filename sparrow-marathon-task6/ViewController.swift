//
//  ViewController.swift
//  sparrow-marathon-task6
//
//  Created by Nikita Bekish on 16.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let cube = UIView()
    
    private var animator: UIDynamicAnimator?
    private var snap: UISnapBehavior?
    
    private var tapPosition: CGPoint = .zero

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
        
        view.addSubview(cube)
        
        cube.backgroundColor = .systemBlue
        cube.layer.cornerRadius = 16
        cube.layer.masksToBounds = true
        
        cube.frame = .init(x: view.bounds.midX - 40, y: view.bounds.midY - 40, width: 80, height: 80)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first, let animator = animator {
            if (snap != nil) {
              animator.removeAllBehaviors()
            }
            
            snap = UISnapBehavior(item: cube, snapTo: touch.location(in: view))
            animator.addBehavior(snap!)
            cube.layer.position = tapPosition
        }
    }
}

