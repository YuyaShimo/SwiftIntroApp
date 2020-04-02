//
//  LoginMovieViewController.swift
//  SwiftIntroApp
//
//  Created by 下新原佑哉 on 2020/03/31.
//  Copyright © 2020 Yuya shimoshimbara. All rights reserved.
//

import UIKit
import AVFoundation

class LoginMovieViewController: UIViewController {
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "start", ofType: "mov")
        
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        //AVPlayer用のlayerを生成
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame  = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            
            //起点を探す
            self.player.seek(to: .zero)
            self.player.play()
        }

        self.player.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    //LOGINボタン押下時に動画を止める
    @IBAction func login(_ sender: Any) {
        
        player.pause()
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
