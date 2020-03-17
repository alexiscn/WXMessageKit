//
//  WXMessageViewController.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import UIKit
import AsyncDisplayKit

open class WXMessageViewController: ASViewController<ASDisplayNode> {
    
    public struct Constants {
        public static var backgroundColor = UIColor(white: 237.0/255, alpha: 1.0)
    }
    
    public var tableNode: ASTableNode!
    
    public var inputBar: WXInputBar!
    
    public let session: WXSession
    
    public let dataSource: WXMessageDataSource
    
    public init(session: WXSession, dataSource: WXMessageDataSource) {
        self.session = session
        self.dataSource = dataSource
        super.init(node: ASDisplayNode())
        
        //node.addSubnode(tableNode)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        node.backgroundColor = Constants.backgroundColor
        
        configureTableNode()
        configureInputBar()
    }
    
    func configureTableNode() {
        tableNode = ASTableNode()
        node.addSubnode(tableNode)
        tableNode.frame = node.bounds
        tableNode.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableNode.backgroundColor = .clear
        tableNode.view.allowsSelection = false
        tableNode.view.separatorStyle = .none
        tableNode.dataSource = self
        tableNode.delegate = self
    }
    
    func configureInputBar() {
        inputBar = WXInputBar(frame: .zero)
        view.addSubview(inputBar)
        
        inputBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            inputBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            inputBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Public functions
extension WXMessageViewController {
    
    public func scrollToLastMessage(animated: Bool) {
        DispatchQueue.main.async {
            let last = self.dataSource.numberOfMessages() - 1
            if last > 0 {
                let indexPath = IndexPath(row: last, section: 0)
                self.tableNode.scrollToRow(at: indexPath, at: .bottom, animated: animated)
            }
        }
    }
    
    public func reloadData() {
        tableNode.reloadData()
    }
}

// MARK: - ASTableDataSource
extension WXMessageViewController: ASTableDataSource {
    
    public func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    public func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfMessages()
    }
    
    public func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let message = dataSource.message(at: indexPath.row)
        let block = { () -> ASCellNode in
            
            var contentNode: WXMessageContentNode
            switch message.content {
            case .text(let text):
                contentNode = WXTextContentNode(message: message, text: text)
            case .image(let media):
                contentNode = WXImageContentNode(message: message, media: media)
            case .video(let media):
                contentNode = WXVideoContentNode(message: message, video: media)
            case .voice(let voice):
                contentNode = WXVoiceContentNode(message: message, voice: voice)
            case .emoticon(let emoticon):
                contentNode = WXEmoticonContentNode(message: message, emoticon: emoticon)
            case .location(let loc):
                contentNode = WXLocationContentNode(message: message, location: loc)
            case .notice(let notice):
                contentNode = WXNoticeContentNode(message: message, notice: notice)
            case .custom(_):
                if let node = self.dataSource.customContentNode(for: message.content, at: indexPath) {
                    contentNode = node
                } else {
                    fatalError("Can not create content node")
                }
            }
            let cellNode = WXMessageCellNode(message: message, contentNode: contentNode)
            return cellNode
        }
        return block
    }
    
}

// MARK: - ASTableDelegate
extension WXMessageViewController: ASTableDelegate {
    
}
