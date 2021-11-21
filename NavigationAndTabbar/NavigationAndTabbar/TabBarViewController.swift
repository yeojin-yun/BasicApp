//
//  TabBarViewController.swift
//  NavigationAndTabbar
//
//  Created by 순진이 on 2021/11/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        
        firstVC.title = "1"
        secondVC.title = "2"
        thirdVC.title = "3"
        
        
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        //firstVC.tabBarItem.image = UIImage(systemName: <#T##String#>)
        //firstVC.tabBarItem.selectedImage = UIImage(systemName: <#T##String#>)
        
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        //secondVC.tabBarItem.image = UIImage(systemName: <#T##String#>)
        //secondVC.tabBarItem.selectedImage = UIImage(systemName: <#T##String#>)
        
        thirdVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        //thirdVC.tabBarItem.image = UIImage(systemName: <#T##String#>)
        //thirdVC.tabBarItem.selectedImage = UIImage(systemName: <#T##String#>)
        
        
        let nav1 = UINavigationController(rootViewController: firstVC)
        let nav2 = UINavigationController(rootViewController: secondVC)
        let nav3 = UINavigationController(rootViewController: thirdVC)
        
        setViewControllers([nav1, nav2, nav3], animated: true)
        //viewControllers = [nav1, nav2, nav3]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
