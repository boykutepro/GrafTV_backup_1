//
//  SUTabBarController.swift
//  project
//
//  Created by Thien Tung on 8/15/20.
//  Copyright © 2020 tranthanh. All rights reserved.
//

import UIKit

class SUTabBarController: UITabBarController, TSSlidingUpPanelStateDelegate {
    
    func slidingUpPanelStateChanged(slidingUpPanelNewState: SLIDE_UP_PANEL_STATE, yPos: CGFloat) {
        
    }
    
    var slidingUpVC: PlayVideoViewController!
    
    let slideUpPanelManager: TSSlidingUpPanelManager = TSSlidingUpPanelManager.with
    
    @IBOutlet weak var suTabBar: UITabBar!
    
    class func newVC() -> SUTabBarController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: SUTabBarController.className) as! SUTabBarController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        slidingUpVC = PlayVideoViewController.newVC()
        
        slideUpPanelManager.slidingUpPanelStateDelegate = self
        
        slideUpPanelManager.initPanelWithTabBar(inView: view, tabBar: suTabBar, slidingUpPanelView: slidingUpVC.view, slidingUpPanelHeaderSize: 49)
        
        slideUpPanelManager.changeSlideUpPanelStateTo(toState: SLIDE_UP_PANEL_STATE.DOCKED)
    }

}
