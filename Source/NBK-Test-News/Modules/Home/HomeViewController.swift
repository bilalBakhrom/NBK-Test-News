//
//  HomeViewController.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import UIKit

public class HomeViewController: UIViewController {
    public let viewModel = HomeViewModel()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(NewsCell.self)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .yellow
        }
    }

    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.observeData { [weak self] didFail in
            guard let self else { return }
            didFail ? self.showError() : self.tableView.reloadData()
        }
        
        viewModel.observeLoader { [weak self] isLoading in
            guard let self else { return }
            isLoading ? self.loader.startAnimating() : self.loader.stopAnimating()
        }
        
        viewModel.fetch()
    }
    
    private func showError() {
        print("ERROR")
    }
}

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(NewsCell.self, for: indexPath)
        cell.configure(with: viewModel.list[indexPath.row])
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
