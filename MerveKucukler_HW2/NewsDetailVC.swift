//
//  NewsDetailVC.swift
//  MerveKucukler_HW2
//
//  Created by Merve on 15.05.2023.
//
import UIKit
import SafariServices

class NewsDetailVC: UIViewController {
    
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var abstractText: UITextView!
    
    var newsResult: NewsResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeTitleLabel()
        customizeBylineLabel()
    }
    
    private func setupUI() {
        titleLabel.text = newsResult?.title
        sectionLabel.text = newsResult?.section
        bylineLabel.text = newsResult?.byline
        abstractText.text = newsResult?.abstract
        
        if let imageURLString = newsResult?.multimedia?.first?.url,
           let imageURL = URL(string: imageURLString) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        self?.newsImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    private func customizeTitleLabel() {
        let titleLabel: UILabel
        if let existingLabel = navigationItem.titleView as? UILabel {
            titleLabel = existingLabel
        } else {
            titleLabel = UILabel()
            navigationItem.titleView = titleLabel
        }
        
        titleLabel.text = "News Detail"
        titleLabel.font = UIFont(name: "Georgia", size: 34)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.sizeToFit()
    }
    
    private func customizeBylineLabel() {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "person.circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let attachmentString = NSAttributedString(attachment: attachment)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        
        if let bylineText = bylineLabel.text {
            let attributedString = NSAttributedString(string: " " + bylineText)
            mutableAttributedString.append(attributedString)
        }
        
        bylineLabel.attributedText = mutableAttributedString
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func seeMoreButtonTapped(_ sender: Any) {
        if let urlString = newsResult?.url,
           let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
}
