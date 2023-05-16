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
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var abstractText: UITextView!
    
    var newsResult: NewsResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    private func setupUI() {
        titleLabel.text = newsResult?.title
        bylineLabel.text = newsResult?.byline
        urlLabel.text = newsResult?.url
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
    
    @IBAction func seeMoreButtonTapped(_ sender: Any) {
        if let urlString = newsResult?.url,
           let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
}
