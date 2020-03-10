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
        let m1 = Message(formatTime: "2020-02-01", content: .text("Hello World"), messageId: "1", isOutgoing: true)
        let m2 = Message(formatTime: nil, content: .text("Hello World"), messageId: "2", isOutgoing: false)
        let m3 = Message(formatTime: nil, content: .image(Media(size: .zero, image: nil, url: URL(string: "https://ww3.sinaimg.cn/bmiddle/007y3qHCly1gcnbt2rq2aj30ku1121kx.jpg"))), messageId: "3", isOutgoing: true)
        let dataSource = MessageDataSource(message: [m1, m2, m3])
        let vc = WXMessageViewController(session: session, dataSource: dataSource)
        navigationController?.pushViewController(vc, animated: true)
    }
}

