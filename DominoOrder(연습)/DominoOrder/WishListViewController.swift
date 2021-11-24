//
//  WishListViewController.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/11/22.
//

import UIKit

class WishListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.navigationItem.title = "WishList"
        //(동일)self.navigationController?.navigationBar.topItem?.title = "Domino's"
        self.navigationController?.navigationBar.barTintColor = .white
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
