//
//  ViewController.swift
//  ZXAutoScrollView
//
//  Created by iFallen on 06/21/2017.
//  Copyright (c) 2017 iFallen. All rights reserved.
//

import UIKit
import ZXAutoScrollView

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var zxAutoScrollView: ZXAutoScrollView!
    var testB:ZXAutoScrollView!
    var dataCount = 5
    var colors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.segmentControl.selectedSegmentIndex = 1
        for _ in 0..<10 {
            let r = CGFloat(arc4random() % 255) / 255.0
            let g = CGFloat(arc4random() % 255) / 255.0
            let b = CGFloat(arc4random() % 255) / 255.0
            colors.append(UIColor(red: r, green: g, blue: b, alpha: 1.0))
        }

        self.zxAutoScrollView.flipInterval = 1 // Default 2
        self.zxAutoScrollView.delegate = self
        self.zxAutoScrollView.dataSource = self
        
        self.testB = ZXAutoScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        self.testB.delegate = self
        self.testB.dataSource = self
        self.testB.autoFlip = false //Default true, if pages less 1 false
        self.testB.backgroundColor = UIColor.gray
        self.testB.center = CGPoint(x: UIScreen.main.bounds.width / 2.0, y: 170)
        self.view.addSubview(testB)
    }
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                dataCount = 1
            case 1:
                dataCount = 5
            case 2:
                dataCount = 10
            default:
                break
        }
        self.zxAutoScrollView.reloadData()
        self.testB.reloadData()
    }
    
    deinit {
        print("ViewController deinit")
    }
}


extension ViewController: ZXAutoScrollViewDataSource {
    
    func numberofPages(_ inScrollView: ZXAutoScrollView) -> Int {
        return dataCount
    }
    
    func zxAutoScrollView(_ scrollView: ZXAutoScrollView, pageAt index: Int) -> UIView {
        let view = UILabel()
        var text = "PageA"
        
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 20)
        if scrollView == zxAutoScrollView {
            text = "PageB"
            view.backgroundColor = colors[index]
        } else {
            view.backgroundColor = colors[9 - index]
        }
        
        view.textColor = UIColor.white
        view.text = "\(text),Index:\(index + 1)"
        return view
    }
}

extension ViewController:ZXAutoScrollViewDelegate {
    func zxAutoScrolView(_ scrollView: ZXAutoScrollView, selectAt index: Int) {
        var text = "PageA"
        if scrollView == zxAutoScrollView {
            text = "PageB"
        }
        let alert = UIAlertController(title: "Tips", message: "\(text),Index:(\(index + 1))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


