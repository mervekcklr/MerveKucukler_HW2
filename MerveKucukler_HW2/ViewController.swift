import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        table.separatorStyle = .none
        return table
    }()
    
    private var result = [NewsResults]()
    private var viewModels = [NewsTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground
        
        setupTableView()
        fetchTopStories()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc private func deviceOrientationDidChange() {
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = UIEdgeInsets(top: 5, left: 5, bottom: 25, right: 10)
        
        let headerView = UIView()
            headerView.backgroundColor = .systemBackground
            
            let titleLabel = UILabel()
            titleLabel.text = "NEWS"
            titleLabel.font = UIFont(name: "Georgia", size: 34)
            titleLabel.textColor = .black
            titleLabel.textAlignment = .center
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])
            
            tableView.tableHeaderView = headerView
            view.addSubview(tableView)
            
            NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }

        
      
    
  private func fetchTopStories() {
        APICaller.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let result):
                self?.result = result
                self?.viewModels = result.compactMap { result in
                    return NewsTableViewCellViewModel(
                        title: result.title,
                        subtitle: result.abstract ,
                        imageURL: URL(string: result.multimedia?.first?.url ?? "")
                    )
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            fatalError("Unable to dequeue NewsTableViewCell")
        }
        
        let viewModel = viewModels[indexPath.row]
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedResult = result[indexPath.row] // Seçilen haber sonucunu alın
        
       
        let detailVC = NewsDetailVC(nibName: "DetailViewController", bundle: nil)
        
        
        detailVC.newsResult = selectedResult
        
       
        navigationController?.pushViewController(detailVC, animated: true)
        
        guard URL(string: selectedResult.url) != nil else {
            return
        }
        
        // let vc = SFSafariViewController(url: url)
        // present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
}
