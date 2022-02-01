//
//  ViewController.swift
//  iosLayout
//
//  Created by nguyen thi ngoc hau on 2022/01/26.
//

import UIKit
//Create Tab Bar App with Navigation in Swift 5 (Xcode 11) - 2022 iOS
//https://www.youtube.com/watch?v=Nx3qPQ_qOFM
//Swift: Create Tab Bar Controller Programmatically (Swift 5, Xcode 11) - 2020 iOS
//https://www.youtube.com/watch?v=6CEWHlM8Ecw

class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Tab Bar Controller", for: .normal)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        view.addSubview(self.button)
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton() {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        
        vc1.title = "First"
        vc2.title = "Second"
        vc3.title = "Third"
        vc4.title = "Fourth"
        vc5.title = "Fifth"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        guard let tabBarItems = tabBarVC.tabBar.items else {
            return
        }
        let icons = ["house", "bell", "person.circle", "star", "gear"]
        for i in 0..<tabBarItems.count {
            tabBarItems[i].badgeValue = "1"
            tabBarItems[i].image = UIImage(systemName: icons[i])
        }
        
        if #available(iOS 15.0, *) {
            let appearanceNav = UINavigationBarAppearance()
            appearanceNav.configureWithOpaqueBackground()
            //appearanceNav.backgroundColor = UIColor.angeBrown
            appearanceNav.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearanceNav
            navigationController?.navigationBar.scrollEdgeAppearance = appearanceNav
            
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .green
            tabBarVC.tabBar.standardAppearance = appearance
            tabBarVC.tabBar.scrollEdgeAppearance = tabBarVC.tabBar.standardAppearance
            tabBarVC.tabBar.itemPositioning = .centered
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}
class FirstViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "First"
        
        let angeBrown = UIColor(displayP3Red: 193/255, green: 122/255, blue: 102/255, alpha: 1)
        
        if #available(iOS 15.0, *) {
            let appearanceNav = UINavigationBarAppearance()
            appearanceNav.configureWithOpaqueBackground()
            appearanceNav.backgroundColor = angeBrown
            appearanceNav.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearanceNav
            navigationController?.navigationBar.scrollEdgeAppearance = appearanceNav
        } else {
            navigationController?.navigationBar.barTintColor = angeBrown
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }
}

class SecondViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Second"
    }
}

class ThirdViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Third"
        
        let angeBrown = UIColor(displayP3Red: 193/255, green: 122/255, blue: 102/255, alpha: 1)
        
        if #available(iOS 15.0, *) {
            let appearanceNav = UINavigationBarAppearance()
            appearanceNav.configureWithOpaqueBackground()
            appearanceNav.backgroundColor = angeBrown
            appearanceNav.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearanceNav
            navigationController?.navigationBar.scrollEdgeAppearance = appearanceNav
        } else {
            navigationController?.navigationBar.barTintColor = angeBrown
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }
}

class FourthViewController: UIViewController {
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Fourth"
    }
}

class FifthViewController: UIViewController {
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        title = "Fifth"
    }
}
