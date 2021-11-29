//
//  ViewController.swift
//  NavigationBarStudy
//
//  Created by 순진이 on 2021/11/28.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -Properties
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        return tableView
    }()
    
    let list = ["Navigation Bar", "NavigationItem", "Navigation toolBar"]
    
    // MARK: -Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.largeContentTitle = "Test"
        setLayout()
        setBasics()
        
    }
    
    
}

// MARK: -UI
extension ViewController {
    final private func setLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
         
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    final private func setBasics() {
        //MARK: -Delegate, Data Source
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //<#tableView#>.register(<#tableViewHeader#>.self, forHeaderFooterViewReuseIdentifier: "<#identifier#>")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}

//MARK: -Delegate, Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = list[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(FirstViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(SecondViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ThirdViewController(), animated: true)
        default:
            break
        }
    }
    
}





