//
//  FirstViewController.swift
//  NavigationBarStudy
//
//  Created by 순진이 on 2021/11/28.
//

import UIKit

class FirstViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        return tableView
    }()
    
    let list = ["BarStyle", "isTanslucent", "barTintColor", "shadowImage", "titleTextAttribute"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "Navigation Bar"
        
        setLayout()
        setBasics()
    
        
    }

}
// MARK: -UI
extension FirstViewController {
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
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
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
            self.navigationController?.pushViewController(BarStyleController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(TranslucentController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(BarTintController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ShadowController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(titleTextController(), animated: true)
        default:
            break
        }
    }
    
}

class BarStyleController: UIViewController {
    
    let barSwitch = UISwitch()
    
    // MARK: -Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Bar Style"
        //navigationController?.navigationBar.barStyle = .black
        setBasics()
    }
    func setBasics() {
        view.addSubview(barSwitch)
        barSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barSwitch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            barSwitch.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        barSwitch.addTarget(self, action: #selector(switchTapped(_:)), for: .valueChanged)
    }
    @objc func switchTapped(_ sender: UISwitch) {
        if barSwitch.isOn {
            navigationController?.navigationBar.barStyle = .black
        } else {
            navigationController?.navigationBar.barStyle = .default
        }
    }
    
}

class TranslucentController: UIViewController {
    let barSwitch = UISwitch()

    // MARK: -Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "isTranslucent"
        view.backgroundColor = .red
        //self.navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationItem.largeTitleDisplayMode = .always
        setBasics()
    }
    func setBasics() {
        view.addSubview(barSwitch)
        barSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barSwitch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            barSwitch.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        barSwitch.addTarget(self, action: #selector(switchTapped(_:)), for: .valueChanged)
    }
    @objc func switchTapped(_ sender: UISwitch) {
        if barSwitch.isOn {
            self.navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.barStyle = .default
        } else {
            self.navigationController?.navigationBar.isTranslucent = true
        }
    }
}


class BarTintController: UIViewController {
    let barSwitch = UISwitch()

    // MARK: -Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bar Tint Color"
        view.backgroundColor = .white
        setBasics()
    }
    func setBasics() {
        view.addSubview(barSwitch)
        barSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barSwitch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            barSwitch.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        barSwitch.addTarget(self, action: #selector(switchTapped(_:)), for: .valueChanged)
    }
    @objc func switchTapped(_ sender: UISwitch) {
        if barSwitch.isOn {
            navigationController?.navigationBar.barTintColor = .brown
            navigationController?.navigationBar.barStyle = .default
            self.navigationController?.navigationBar.isTranslucent = true
            
        } else {
            navigationController?.navigationBar.barTintColor = .green
        }
    }
}

class ShadowController: UIViewController {
    let barSwitch = UISwitch()

    // MARK: -Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Shadow Image"
        view.backgroundColor = .white
        setBasics()
    }
    func setBasics() {
        view.addSubview(barSwitch)
        barSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barSwitch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            barSwitch.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        barSwitch.addTarget(self, action: #selector(switchTapped(_:)), for: .valueChanged)
    }
    @objc func switchTapped(_ sender: UISwitch) {
        if barSwitch.isOn {
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.barStyle = .default
            self.navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.shadowImage = .add
        } else {
            navigationController?.navigationBar.shadowImage = .none
        }
    }
}

class titleTextController: UIViewController {
    let barSwitch = UISwitch()

    // MARK: -Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Title Text"
        setBasics()
    }
    func setBasics() {
        view.addSubview(barSwitch)
        barSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barSwitch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            barSwitch.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        barSwitch.addTarget(self, action: #selector(switchTapped(_:)), for: .valueChanged)
    }
    @objc func switchTapped(_ sender: UISwitch) {
        if barSwitch.isOn {
            navigationController?.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.blue, .font: UIFont(name: "MarkerFelt-Thin", size: 20)!]
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.barStyle = .default
            self.navigationController?.navigationBar.isTranslucent = true
            navigationController?.navigationBar.shadowImage = .none
        }
    }
    
}
