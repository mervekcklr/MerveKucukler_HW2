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
