//
//  WXInputBar.swift
//  WXMessageKit
//
//  Created by xushuifeng on 2020/3/16.
//

import UIKit

/*
 ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐
   ┌────┐ ┌ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┐  ┌────┐ ┌────┐
 │ │voic│        Input Text View         │stic│ │more│ │
   │ e  │ │                           │  │ker │ │    │
 │ └────┘  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─   └────┘ └────┘ │
  ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
 │                                                     │
 │                                                     │
                    Custom Input View
 │                                                     │
 │                                                     │
 └ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ┘
 */
public class WXInputBar: UIView {
    
    /// Container view for input views, include `inputTextView`, `voiceButton`, `stickerButton`, `moreButton`
    public let inputContainerView: UIView
    
    public let voiceButton: UIButton
    
    public let stickerButton: UIButton
    
    public let moreButton: UIButton
    
    public let inputTextView: UITextView
    
    public var maximumNumberOfLines: Int = 4
    
    public var customInputContainerView: UIView!
    
    public var stickerPanel: UIView!
    
    public var morePanel: UIView!
    
    public var preferredHeightOfMorePanel: CGFloat = 240.0
    
    public var preferredHeightOfStickerPanel: CGFloat = 240.0
    
    public weak var associatedTableView: UITableView?
    
    private var safeAreaBottomInset: CGFloat {
        return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0
    }
    
    private var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    private var inputTextViewHeightConstraint: NSLayoutConstraint!
    private var customInputContainerHeightConstraint: NSLayoutConstraint!
    private var reportHeightUpdateWhenKeyboardFrameChanges = false
    private var hasLayoutSubviews = false
    
    public override init(frame: CGRect) {
        
        inputContainerView = UIView()
        
        voiceButton = UIButton(type: .system)
        voiceButton.tintColor = .clear
        voiceButton.setImage(WXUtility.imageNamed("WX_InputBar_Voice")?.withRenderingMode(.alwaysOriginal), for: .normal)
        voiceButton.setImage(WXUtility.imageNamed("WX_InputBar_Keyboard")?.withRenderingMode(.alwaysOriginal), for: .selected)
        
        stickerButton = UIButton(type: .system)
        stickerButton.tintColor = .clear
        stickerButton.setImage(WXUtility.imageNamed("WX_InputBar_Sticker")?.withRenderingMode(.alwaysOriginal), for: .normal)
        stickerButton.setImage(WXUtility.imageNamed("WX_InputBar_Keyboard")?.withRenderingMode(.alwaysOriginal), for: .selected)
        
        moreButton = UIButton(type: .system)
        moreButton.tintColor = .clear
        moreButton.setImage(WXUtility.imageNamed("WX_InputBar_Add")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        inputTextView = UITextView(frame: .zero)
        inputTextView.font = UIFont.systemFont(ofSize: 17)
        inputTextView.textContainerInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        inputTextView.layer.cornerRadius = 6
        inputTextView.layer.masksToBounds = true
        inputTextView.tintColor = UIColor(red: 0.0, green: 194.0/255, blue: 95.0/255, alpha: 1.0)
        
        customInputContainerView = UIView()
        
        stickerPanel = UIView()
        stickerPanel.backgroundColor = .red
        
        morePanel = UIView()
        morePanel.backgroundColor = .green
        
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 245.0/255, green: 246.0/255, blue: 247.0/255, alpha: 1.0)
        
        addSubview(inputContainerView)
        
        inputContainerView.addSubview(voiceButton)
        inputContainerView.addSubview(inputTextView)
        inputContainerView.addSubview(stickerButton)
        inputContainerView.addSubview(moreButton)
        
        addSubview(customInputContainerView)
        
        configureConstraints()
        configureEvents()
        registerKeyboardNotifications()
        
        inputTextView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        inputContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            inputContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            inputContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        voiceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voiceButton.widthAnchor.constraint(equalToConstant: 40),
            voiceButton.heightAnchor.constraint(equalToConstant: 40),
            voiceButton.leadingAnchor.constraint(equalTo: inputContainerView.leadingAnchor, constant: 6),
            voiceButton.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -8)
        ])
        
        stickerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stickerButton.widthAnchor.constraint(equalToConstant: 40),
            stickerButton.heightAnchor.constraint(equalToConstant: 40),
            stickerButton.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -3),
            stickerButton.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -8)
        ])
        
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.leadingAnchor.constraint(equalTo: voiceButton.trailingAnchor, constant: 3).isActive = true
        inputTextView.topAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 8).isActive = true
        inputTextView.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -8).isActive = true
        inputTextView.trailingAnchor.constraint(equalTo: stickerButton.leadingAnchor, constant: -3).isActive = true
        inputTextViewHeightConstraint = inputTextView.heightAnchor.constraint(equalToConstant: 40)
        inputTextViewHeightConstraint.isActive = true
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 40),
            moreButton.heightAnchor.constraint(equalToConstant: 40),
            moreButton.trailingAnchor.constraint(equalTo: inputContainerView.trailingAnchor, constant: -3),
            moreButton.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: -8)
        ])
        
        customInputContainerView.translatesAutoresizingMaskIntoConstraints = false
        customInputContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        customInputContainerView.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor).isActive = true
        customInputContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        customInputContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        customInputContainerHeightConstraint = customInputContainerView.heightAnchor.constraint(equalToConstant: safeAreaBottomInset)
        customInputContainerHeightConstraint.isActive = true
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if !hasLayoutSubviews {
            hasLayoutSubviews = true
            setPreferredContentHeight(bounds.height, animated: false)
        }
    }
}

// MARK: - Public Functions
extension WXInputBar {
    
    public func dismiss() {
        if inputTextView.isFirstResponder {
            inputTextView.resignFirstResponder()
        } else {
            // TODO
        }
    }
    
}

// MARK: - Private Works
extension WXInputBar {
    
    private func configureEvents() {
        voiceButton.addTarget(self, action: #selector(voiceButtonClicked(_:)), for: .touchUpInside)
        stickerButton.addTarget(self, action: #selector(stickerButtonClicked(_:)), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonClicked(_:)), for: .touchUpInside)
    }
    
    @objc private func moreButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            inputTextView.becomeFirstResponder()
        } else {
            resignTextViewWithoutReportingHeightUpdate()
            loadCustomInput(morePanel, preferredHeight: preferredHeightOfMorePanel)
        }
        sender.isSelected.toggle()
    }
    
    @objc private func voiceButtonClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @objc private func stickerButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            inputTextView.becomeFirstResponder()
        } else {
            resignTextViewWithoutReportingHeightUpdate()
            loadCustomInput(stickerPanel, preferredHeight: preferredHeightOfStickerPanel)
        }
        sender.isSelected.toggle()
    }
    
    private func loadCustomInput(_ inputView: UIView, preferredHeight: CGFloat) {
        
        customInputContainerView.subviews.forEach { $0.removeFromSuperview() }
        customInputContainerView.addSubview(inputView)
        inputView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputView.leadingAnchor.constraint(equalTo: customInputContainerView.leadingAnchor),
            inputView.topAnchor.constraint(equalTo: customInputContainerView.topAnchor),
            inputView.trailingAnchor.constraint(equalTo: customInputContainerView.trailingAnchor),
            inputView.heightAnchor.constraint(equalToConstant: preferredHeight)
        ])
        customInputContainerHeightConstraint.constant = safeAreaBottomInset + preferredHeight
        
        UIView.animate(withDuration: 0.25) {
            UIView.setAnimationCurve(.overdamped)
            self.customInputContainerView.alpha = 1
        }
    }
    
    private func dismissCustomInput() {
        stickerButton.isSelected = false
        moreButton.isSelected = false
        voiceButton.isSelected = false
        
        UIView.animate(withDuration: 0.25) {
            UIView.setAnimationCurve(.overdamped)
            self.customInputContainerView.alpha = 0
        }
    }
    
    private func resignTextViewWithoutReportingHeightUpdate() {
        guard inputTextView.isFirstResponder else {
            return
        }
        reportHeightUpdateWhenKeyboardFrameChanges = false
        inputTextView.resignFirstResponder()
        reportHeightUpdateWhenKeyboardFrameChanges = true
    }
    
    private func setPreferredContentHeight(_ contentHeight: CGFloat, animated: Bool) {
        updateTableViewInsets(with: contentHeight, animated: animated)
    }
    
    private func updateTableViewInsets(with preferredHeight: CGFloat, animated: Bool) {
        
        guard let tableView = associatedTableView else {
            return
        }
        
        tableView.scrollIndicatorInsets.bottom = preferredHeight - safeAreaBottomInset
        if animated {
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.25)
            UIView.setAnimationCurve(.overdamped)
        }
        
        let offset = tableView.contentOffset.y + preferredHeight - tableView.contentInset.bottom
        
        tableView.contentInset.bottom = preferredHeight
        tableView.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
        
        if animated {
            UIView.commitAnimations()
        }
    }
}

// MARK: - Keyboard

extension WXInputBar {
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrame(_:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardDidShow(_ notification: Notification) {
        guard inputTextView.isFirstResponder else {
            return
        }
    }
    
    @objc private func keyboardWillChangeFrame(_ notification: Notification) {
        guard let endFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let keyboardWillBeInvisible = (screenHeight - endFrame.origin.y) <= 1
        if !keyboardWillBeInvisible {
            customInputContainerHeightConstraint.constant = endFrame.height 
        }
        
        if keyboardWillBeInvisible {
            
        } else {
            let height = screenHeight - endFrame.origin.y + inputContainerView.frame.height
            if bounds.height != height {
                setPreferredContentHeight(height, animated: false)
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
    }
}

// MARK: - UITextViewDelegate
extension WXInputBar: UITextViewDelegate {
    
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        dismissCustomInput()
        return true
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        guard let lineHeight = textView.font?.lineHeight else {
            return
        }

        let maxHeight = ceil(
            lineHeight * CGFloat(maximumNumberOfLines)
            + textView.textContainerInset.top
            + textView.textContainerInset.bottom)
        
        let sizeToFit = CGSize(width: textView.bounds.width, height: UIView.layoutFittingExpandedSize.height)
        let contentHeight = ceil(textView.sizeThatFits(sizeToFit).height)
        textView.isScrollEnabled = contentHeight > maxHeight
        let newHeight = min(contentHeight, maxHeight)
        let oldHeight = inputTextViewHeightConstraint.constant
        let diff = newHeight - oldHeight
        if abs(diff) > 0.1 {

            inputTextViewHeightConstraint.constant = newHeight
        }
    }
}
