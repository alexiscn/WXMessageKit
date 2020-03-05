//
//  WXMessageViewController.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/5.
//

import UIKit
import AsyncDisplayKit

open class WXMessageViewController: ASViewController<ASDisplayNode> {
    
    public let tableNode = ASTableNode()
    
    public let session: WXSession
    
    public let dataSource: WXMessageDataSource
    
    public init(session: WXSession, dataSource: WXMessageDataSource) {
        self.session = session
        self.dataSource = dataSource
        super.init(node: ASDisplayNode())
        
        node.addSubnode(tableNode)
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        node.backgroundColor = .white
        
        configureTableNode()
        
    }
    
    func configureTableNode() {
        tableNode.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableNode.view.allowsSelection = false
        tableNode.view.separatorStyle = .none
        tableNode.dataSource = self
        tableNode.delegate = self
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
        //let message = 
        let block = {
            return ASCellNode()
        }
        return block
    }
    
}

// MARK: - ASTableDelegate
extension WXMessageViewController: ASTableDelegate {
    
}
