//
//  NewsViewController.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

class NewsViewController: BaseViewController {
    
    let newsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI() {
        view.addSubview(newsTableView)
        newsTableView.makeConstraintsWithContainer(view) { tableview, container in
            tableview.edges.equalTo(container.edges)
        }
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.estimatedRowHeight = 50
        newsTableView.separatorStyle = .singleLine
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
    }

}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath)
        return cell
    }
    
    
}
