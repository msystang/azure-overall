//
//  CartViewController.swift
//  azure-overall
//
//  Created by Sunni Tang on 3/26/20.
//  Copyright © 2020 Sunni Tang. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    // MARK: - UI Objects
    lazy var recipeTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.recipeTableViewCell.rawValue)
        return tableView
    }()
    
    // MARK: - Internal Properties
    var recipes = [Recipe]() {
        didSet{
            recipeTableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        addSubviews()
        addConstraints()
        
        setTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadCart()
    }
    
    // MARK: - Private Methods
    private func setTitle() {
        self.navigationItem.title = "My Cart"
    }
    
    private func loadCart() {
        do {
            recipes = try RecipePersistenceHelper.manager.getRecipes()
        } catch {
            print(error.localizedDescription)
        }
    }
}
