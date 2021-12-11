# BasicApp
BasicApp  
#### 2021.12.11
### UITabBarController in code
```swift
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        
        let tabBarVC = UITabBarController()
        
        let fisrtVC = FirstViewController()
        let secondVC = SecondViewController()
        
        let nav1 = UINavigationController(rootViewController: fisrtVC)
        let nav2 = UINavigationController(rootViewController: secondVC)
        
        nav1.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "pencil"), tag: 0)
        nav1.navigationBar.topItem?.title = "First VC"
        //nav1.navigationItem.title = "Test"
        
        
        nav2.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "folder"), tag: 1)
        nav2.navigationBar.topItem?.title = "Second VC"
        
        //tabBarVC.viewControllers = [nav1, nav2]
        tabBarVC.setViewControllers([nav1, nav2], animated: true)
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }

```


---
#### 2021.12.03  
### tableview에서 각각 다른 목록을 불러와야 할 때, 빈 배열을 만들고 각 항목을 빈 배열에 넣으면 된다.  
### 예를들어, 프리미엄 피자 / 슈퍼시드 피자 / 클래식 피자를 각각 누르면, 해당 도우 피자 목록이 나와야 한다면, 각 피자들을 배열로 만들어 그 배열을 indexPath.row로 부르면 된다.  
---
#### 2021.12.02  
### Navigation Bar 예제 만들기  
---
#### 2021.11.28. 
### 네비게이션에서 pushViewController를 하려면 푸시하려는 뷰컨도 네비게이션의 루트뷰 컨트롤러여야 한다.  
---
#### 2021.11.27  
### Navigation Controller  
---
#### 2021.11.20  
### TabBar with Code  
---
#### 2021.11.18  
### TabBarcontroller with code
---
#### 2021.11.17  
### Study
### snippet
---
#### 2021.11.16  
### 테이블뷰 셀 터치 시, 이동 찾아보기  
---
#### 2021.11.15  
### 테이블뷰 코드 구현
---
