//
//  File.swift
//  MerveKucukler_HW2
//
//  Created by Merve on 13.05.2023.
//

import Foundation
/* let task = session.dataTask(with: url!) { data, response , error in
     <#code#>
     if error != nil {
         let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: <#T##UIAlertController.Style#>.alert)
         let okButton = UIAlertAction(title: "OK", style: <#T##UIAlertAction.Style#>.default, handler : nil)   ATIL */


/*  APICaller.shared.getTopStories { [weak self] result in
 switch result {
 case .success(let articles):
     self?.articles = articles
     self?.viewModels = articles.compactMap ({
         NewsTableViewCellViewModel (title: $0.title,
         subtitle: $0.description ?? "No Description",
         imageURL: URL(string: $0.urlToImage ?? "")
         )
     })
     DispatchQueue.main.async {
         self?.tableView.reloadData()
     }
 case .failure(let error):
     print(error)
 }
}
}*/



/*guard let multimedia = article.multimedia.first,
                        let url = multimedia.url,
                        let imageURL = URL(string: url) else {
                      return nil
                  }
                  return NewsTableViewCellViewModel(
                      title: article.title,
                      subtitle: article.abstract ?? "No Description",
                      imageURL: imageURL
                  )
              }
              
              } */


// Table

/*7func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModels.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
        withIdentifier: "cell", for: indexPath) as? NewsTableViewCell else {
        fatalError("Unable to dequeue NewsTableViewCell")
    }
    
    cell.configure(with: viewModels[indexPath.row])
    return cell
} */



/*  fetchTopStories()
 
 func viewDidLayoutSubviews () {
     super.viewDidLayoutSubviews()
     tableView.frame = view.bounds
 }
 private func fetchTopStories() {
     APICaller.shared.getTopStories { [weak self] result in
         switch result {
         case .success(let articles):
             self?.articles = articles
             self?.viewModels = articles.compactMap { article in
                 guard let multimedia = article.multimedia.first,
                       let url = multimedia.url,
                       let imageURL = URL(string: url) else {
                     return nil
                 }
                 return NewsTableViewCellViewModel(
                     title: article.title,
                     subtitle: article.abstract ?? "No Description",
                     imageURL: imageURL
                 )
             }
             DispatchQueue.main.async {
                 self?.tableView.reloadData()
             }
         case .failure(let error):
             print(error)
         }
     }
 }*/


/*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let result = result[indexPath.row]
    guard let url = URL(string: result.url) else {
        return
    }
    
    let vc = SFSafariViewController(url: url)
    present(vc, animated: true)
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
}
}
 
*/






/* import UIKit
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
         title = "News"
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
 \ private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     tableView.deselectRow(at: indexPath, animated: true)
     let selectedResult = results[indexPath.row]
     /*guard let url = URL(string: selectedResult.url) else {
      return
      }
      
      let vc = SFSafariViewController(url: url)
      present(vc, animated: true)
      }*/
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 150
     }
 }
*/
