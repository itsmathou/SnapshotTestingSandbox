//
//  ViewController.swift
//  SnapshotTestingSandbox
//
//  Created by Mathilde Ferrand on 10/07/2020.
//

import UIKit

class ViewController: UIViewController {
    
    let largeTitle = UILabel()
    let body = UILabel()
    let oneImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(largeTitle)
        view.addSubview(body)
        view.addSubview(oneImageView)
        
        largeTitle.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        oneImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            oneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            oneImageView.bottomAnchor.constraint(equalTo: largeTitle.topAnchor, constant: -10),
            oneImageView.widthAnchor.constraint(equalToConstant: 40),
            oneImageView.heightAnchor.constraint(equalToConstant: 40),
            
            largeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            largeTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            body.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            body.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 10)
        ])
        
        largeTitle.text = "Large title"
        largeTitle.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        largeTitle.adjustsFontForContentSizeCategory = true
        
        body.text = "Body"
        body.font = UIFont.preferredFont(forTextStyle: .body)
        body.adjustsFontForContentSizeCategory = true
        
        oneImageView.image = UIImage(systemName: "pencil.circle")
        oneImageView.tintColor = .red
    }
}

