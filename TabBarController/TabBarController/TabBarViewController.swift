//
//  TabBarViewController.swift
//  TabBarController
//
//  Created by 순진이 on 2021/11/18.
//

import UIKit

class TabBarViewController: UITabBarController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    let menu: [Menu] = [
        Menu(menu: UIImage(named: "클래식.png")!),
        Menu(menu: UIImage(named: "프리미엄.png")!),
        Menu(menu: UIImage(named: "슈퍼시드.png")!),
        Menu(menu: UIImage(named: "사이드디시.png")!),
        Menu(menu: UIImage(named: "음료.png")!),
        Menu(menu: UIImage(named: "피클소스.png")!)
    ]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        return tableView
    }()
    
    let logo = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        setTable()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellId, for: indexPath) as! CustomTableViewCell
        
        cell.menuImg.image = menu[(indexPath.row)].menu
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let firstVC = FirstNavigationViewController()
        let secondVC = SecondNavigationViewController()
        
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(firstVC, animated: true)
        case 1:
            self.navigationController?.pushViewController(secondVC, animated: true)
        default:
            break
        }
        //self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func attribute() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellId)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    func setTable() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
        logo.image = UIImage(named: "logo.png")
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logo)
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logo.bottomAnchor.constraint(equalTo: tableView.topAnchor)
        ])
        
    }
    
    
    
}

