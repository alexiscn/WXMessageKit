//
//  ViewController.swift
//  WXMessageKitExample
//
//  Created by xushuifeng on 2020/3/5.
//  Copyright © 2020 alexiscn. All rights reserved.
//

import UIKit
import WXMessageKit
import AsyncDisplayKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTestButton()
    }

    private func configureTestButton() {
        let button = UIButton(type: .system)
        button.setTitle("Chat", for: .normal)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
     
        button.addTarget(self, action: #selector(handleTestButtonClicked), for: .touchUpInside)
    }

    @objc private func handleTestButtonClicked() {
        let session = Session(sessionId: "1001")
        let dataSource = MessageDataSource(message: SampleData.shared.messages())
        let vc = WXMessageViewController(session: session, dataSource: dataSource)
        navigationController?.pushViewController(vc, animated: true)
    }
}

