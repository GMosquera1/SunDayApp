//
//  SearchViewController.swift
//  SunDay
//
//  Created by Genesis Mosquera on 12/28/18.
//  Copyright © 2018 Genesis Mosquera. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
     private var quotations = [MultipleQuotes]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var currentQuote: MultipleQuotes?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
       
       // searchQuotes(keyword: "inspirational")
    }
    
    private func loadData(){
        for _ in 0...19 {
            let _  = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(callQuote), userInfo: nil, repeats: true)
            }
    }

    @objc func callQuote() {
        QuotesAPIClient.getQuote { (onlineQuotes, error) in
            if let quote = onlineQuotes {
                self.quotations.append(quote)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
        let searchDetailViewController = segue.destination as?
            SearchDetailViewController else { fatalError("indexPath, searchDetailViewController nil")
        
        }
        searchDetailViewController.quotes = quotations[indexPath.row]
      //  let quote = quotations[indexPath.row]
     //   searchDetailViewController.quote = quote
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
       cell.textLabel?.text = quotations[indexPath.row].quoteText
     //   let quote = Quote[indexPath.row]
      //  cell.textLabel?.text = Quote.name
        return cell
    }
}
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text,
        !searchText.isEmpty,
            let searchTextEncoded = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
                return
        }
      //  searchQuotes(keyword: searchTextEncoded)
    }
}
