import UIKit

import UIKit

class NewsTableViewCellViewModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data?
    
    init(title: String, subtitle: String, imageURL: URL?, imageData: Data? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.imageData = imageData
    }
}

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(newsImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize: CGFloat = 120
        let contentPadding: CGFloat = 10
        
        let availableWidth = contentView.bounds.width - contentPadding * 3 - imageSize
        let titleLabelSize = newsTitleLabel.sizeThatFits(CGSize(width: availableWidth, height: CGFloat.greatestFiniteMagnitude))
        let subtitleLabelSize = subtitleLabel.sizeThatFits(CGSize(width: availableWidth, height: CGFloat.greatestFiniteMagnitude))
        
        let titleLabelHeight = min(titleLabelSize.height, contentView.bounds.height / 2)
        let subtitleLabelHeight = min(subtitleLabelSize.height, contentView.bounds.height / 2)
        
        newsTitleLabel.frame = CGRect(
            x: contentPadding,
            y: contentPadding,
            width: availableWidth,
            height: titleLabelHeight
        )
        
        subtitleLabel.frame = CGRect(
            x: contentPadding,
            y: newsTitleLabel.frame.maxY + contentPadding,
            width: availableWidth,
            height: subtitleLabelHeight
        )
        
        newsImageView.frame = CGRect(
            x: contentView.bounds.width - imageSize - contentPadding,
            y: (contentView.bounds.height - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsTitleLabel.text = nil
        subtitleLabel.text = nil
        newsImageView.image = nil
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        } else if let url = viewModel.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let data = data, error == nil else { return }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self!.newsImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}


