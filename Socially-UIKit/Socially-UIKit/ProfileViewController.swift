//
//  ProfileViewController.swift
//  Socially-UIKit
//
//  Created by Jungjin Park on 2024-07-26.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 0)
    }
}
