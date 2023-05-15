import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return table
    }()
    
    private var result = [NewsResults]()
    private var viewModels = [NewsTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // title = "News"
        view.backgroundColor = .systemBackground
        
        setupTableView()
        fetchTopStories()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    private func fetchTopStories() {
        APICaller.shared.getTopStories { [weak self] result in
            switch result {
            case .success(let result):
                self?.result = result
                self?.viewModels = result.compactMap { result in
                    return NewsTableViewCellViewModel(
                        title: result.title,
                        subtitle: result.abstract ?? "No Description",
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
        
        // Detay sayfasını oluşturun
        let detailVC = NewsDetailVC(nibName: "DetailViewController", bundle: nil)
        
        // Seçili haber sonucunu detay sayfasına aktarın
        detailVC.newsResult = selectedResult
        
        // Detay sayfasını görüntüleyin
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
    
   /// SafariViewController kullanımı için örnek kod
  /*  private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedResult = result[indexPath.row]
        ;guard let url = URL(string: selectedResult.url) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

