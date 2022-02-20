//
//  ViewController.swift
//  TestCollections
//
//  Created by Vincent Cubit on 11/12/21.
//


import UIKit


class ViewController: UIViewController {

    
    private let thisView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let anotherView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.thisView)
        self.thisView.addSubview(self.anotherView)
        self.addConstraints()
    }
    
    
    
    
    
    
    
}

