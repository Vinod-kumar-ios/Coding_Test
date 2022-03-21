//
//  NewsViewController.swift
//  Coding_Test
//
//  Created by Vinod on 20/03/22.
//

import UIKit

class NewsViewController: BaseViewController {
    
    let newsTableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    var viewModel: ArticleListViewModel?
    let apiClient:Webservice
    
    
    init(apiClient: Webservice) {
        self.apiClient = apiClient
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        getNews()
    }
    
    func prepareUI() {
        self.title = "Headlines"
        view.addSubview(newsTableView)
        newsTableView.makeConstraintsWithContainer(view) { tableview, container in
            tableview.edges.equalTo(container.edges)
        }
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.estimatedRowHeight = 50
        newsTableView.separatorStyle = .singleLine
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        refreshControl.addTarget(self, action: #selector(self.pullTorRefresh(_:)), for: .valueChanged)
        newsTableView.addSubview(refreshControl)
    }
    
    @objc func pullTorRefresh(_ sender: AnyObject) {
        getNews()
    }
    
    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.populateNews(article: viewModel?.articleAtIndex(indexPath.row))
        return cell
    }
}

//MARK: API calling
extension NewsViewController{
    func getNews() {
        apiClient.getArticles(endPoint: APIConfig.shared.baseURL, completion: { [weak self] result in
            DispatchQueue.main.async {[weak self] in
                self?.refreshControl.endRefreshing()
            }
            switch result {
            case .success(let response):
               self?.viewModel = ArticleListViewModel(articles: response.articles)
                DispatchQueue.main.async {[weak self] in
                    self?.newsTableView.reloadData()
                }
            case .failure(let error):
                self?.presentAlert(title: error.localizedDescription, message: "")
            }
        })
    }
}
