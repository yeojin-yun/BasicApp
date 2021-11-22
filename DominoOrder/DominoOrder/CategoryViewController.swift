//
//  CategoryViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit
import SnapKit


class CategoryViewController: UIViewController {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setBasics()
    }
    
    
}

//MARK: -UI
extension CategoryViewController {
    final private func setLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = true
   
        tableView.snp.makeConstraints {
            $0.left.equalTo(view.safeAreaLayoutGuide)
            $0.right.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    final private func setBasics() {
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellId)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellId, for: indexPath) as! CustomTableViewCell
        
        cell.menuImg.image = menu[(indexPath.row)].menu
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = ProductViewController()
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(nextVC, animated: true)
        default:
            break
        }
    }
    
}

