//
//  HomeViewController.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 19/10/2022.
//

import UIKit
import SwiftUI
import NewsNetwork

public class HomeViewController: UIViewController {
    public var viewModel: HomeViewModel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(NewsCell.self)
            tableView.showsVerticalScrollIndicator = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .clear
            tableView.separatorStyle = .none
        }
    }

    @IBOutlet weak var loader: UIActivityIndicatorView!
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        set(viewModel: HomeViewModel())
    }
    
    public func set(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        setupNavigationTitle()
        bind()
        viewModel.fetch()
    }
    
    public func setupNavigationTitle() {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .theme.accent
        label.text = "Today's News"
        
        navigationItem.titleView = label
    }
    
    private func bind() {
        viewModel.observeList { [weak self] _, start, end in
            guard let self else { return }
            
            let rows = (start...end).map { IndexPath(row: $0, section: 0) }
            self.tableView.insertRows(at: rows, with: .bottom)
        }
        
        viewModel.observeError { [weak self] error in
            guard let self else { return }
            
            self.showError(error)
        }
        
        viewModel.observeLoaderState { [weak self] isLoading in
            guard let self else { return }
            isLoading ? self.loader.startAnimating() : self.loader.stopAnimating()
        }
    }
    
    private func showError(_ error: NError) {
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
        
        if indexPath.row == viewModel.list.count - 1 {
            viewModel.fetch()
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * 0.65
    }
}

extension HomeViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = DetailsView(article: viewModel.$listManager.list[indexPath.row])
        let hostingController = UIHostingController(rootView: detailsView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
