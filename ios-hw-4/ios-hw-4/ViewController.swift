//
//  ViewController.swift
//  ios-hw-4
//
//  Created by haya on 6/29/20.
//  Copyright © 2020 haya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var bombSoundEffect: AVAudioPlayer?
    func music(){
        let path = Bundle.main.path(forResource: "fade.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        music()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    
    @IBOutlet weak var turnLabel: UILabel!
    var counter = 0
    @IBAction func press(_ sender: UIButton) {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
        if counter % 2 == 0 {
            sender.setBackgroundImage(UIImage(named: "350"), for: .normal)
            
            turnLabel.text = "750's Turn"
            
        }
        else if counter % 2 != 0 {
            sender.setBackgroundImage(UIImage(named: "750"), for: .normal)
            
            turnLabel.text = "350's Turn"
        }
        counter += 1
        
        sender.isEnabled = false
        
        threeFiftyWinning()
        sevenFiftyWinning()
        
        if  counter == 9 {
            let alertController = UIAlertController(title: "Its a draw.", message: "Press on the following button to restart the game.", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Game", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
            
        }
        
        
        
        
    }
    
    @IBAction func resetTapped() {
        restartGame()
    }
    
    
    
    
    func threeFiftyWinning() { if (b1.backgroundImage(for: .normal) == UIImage(named: "350") && b2.backgroundImage(for: .normal) == UIImage(named: "350") && b3.backgroundImage(for: .normal) == UIImage(named: "350")) || (b4.backgroundImage(for: .normal) == UIImage(named: "350") && b5.backgroundImage(for: .normal) == UIImage(named: "350") && b6.backgroundImage(for: .normal) == UIImage(named: "350")) || (b7.backgroundImage(for: .normal) == UIImage(named: "350") && b8.backgroundImage(for: .normal) == UIImage(named: "350") && b9.backgroundImage(for: .normal) == UIImage(named: "350")) ||
        (b1.backgroundImage(for: .normal) == UIImage(named: "350") && b4.backgroundImage(for: .normal) == UIImage(named: "350") && b7.backgroundImage(for: .normal) == UIImage(named: "350")) ||
        (b2.backgroundImage(for: .normal) == UIImage(named: "350") && b5.backgroundImage(for: .normal) == UIImage(named: "350") && b8.backgroundImage(for: .normal) == UIImage(named: "350")) ||
        (b3.backgroundImage(for: .normal) == UIImage(named: "350") && b6.backgroundImage(for: .normal) == UIImage(named: "350") && b9.backgroundImage(for: .normal) == UIImage(named: "350")) ||
        (b1.backgroundImage(for: .normal) == UIImage(named: "350") && b5.backgroundImage(for: .normal) == UIImage(named: "350") && b9.backgroundImage(for: .normal) == UIImage(named: "350")) ||
        (b3.backgroundImage(for: .normal) == UIImage(named: "350") && b5.backgroundImage(for: .normal) == UIImage(named: "350") && b7.backgroundImage(for: .normal) == UIImage(named: "350"))
    {
        print( "350 wins")
        let alertController = UIAlertController(title: "350 won!", message: "Press on the following button to restart the game", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart Game", style: .cancel) { (alert) in
            self.restartGame()
        }
        alertController.addAction(restartAction)
        present(alertController, animated: true, completion: nil)
        
        }
    }
    func sevenFiftyWinning() {
        if (b1.backgroundImage(for: .normal) == UIImage(named: "750") && b2.backgroundImage(for: .normal) == UIImage(named: "750") && b3.backgroundImage(for: .normal) == UIImage(named: "750")) || (b4.backgroundImage(for: .normal) == UIImage(named: "750") && b5.backgroundImage(for: .normal) == UIImage(named: "750") && b6.backgroundImage(for: .normal) == UIImage(named: "750")) || (b7.backgroundImage(for: .normal) == UIImage(named: "750") && b8.backgroundImage(for: .normal) == UIImage(named: "750") && b9.backgroundImage(for: .normal) == UIImage(named: "750")) ||
            (b1.backgroundImage(for: .normal) == UIImage(named: "750") && b4.backgroundImage(for: .normal) == UIImage(named: "750") && b7.backgroundImage(for: .normal) == UIImage(named: "750")) ||
            (b2.backgroundImage(for: .normal) == UIImage(named: "750") && b5.backgroundImage(for: .normal) == UIImage(named: "750") && b8.backgroundImage(for: .normal) == UIImage(named: "750")) ||
            (b3.backgroundImage(for: .normal) == UIImage(named: "750") && b6.backgroundImage(for: .normal) == UIImage(named: "750") && b9.backgroundImage(for: .normal) == UIImage(named: "750")) ||
            (b1.backgroundImage(for: .normal) == UIImage(named: "750") && b5.backgroundImage(for: .normal) == UIImage(named: "750") && b9.backgroundImage(for: .normal) == UIImage(named: "750")) ||
            (b3.backgroundImage(for: .normal) == UIImage(named: "750") && b5.backgroundImage(for: .normal) == UIImage(named: "750") && b7.backgroundImage(for: .normal) == UIImage(named: "750"))
        {
            print( "750 wins")
            let alertController = UIAlertController(title: "750 won!", message: "Press on the following button to restart the game.", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart Game", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    func restartGame()
    { b1.setBackgroundImage(nil, for: .normal)
        b1.isEnabled = true
        
        b2.setBackgroundImage(nil, for: .normal)
        b2.isEnabled = true
        
        b3.setBackgroundImage(nil, for: .normal)
        b3.isEnabled = true
        
        b4.setBackgroundImage(nil, for: .normal)
        b4.isEnabled = true
        
        b5.setBackgroundImage(nil, for: .normal)
        b5.isEnabled = true
        
        b6.setBackgroundImage(nil, for: .normal)
        b6.isEnabled = true
        
        b7.setBackgroundImage(nil, for: .normal)
        b7.isEnabled = true
        
        b8.setBackgroundImage(nil, for: .normal)
        b8.isEnabled = true
        
        b9.setBackgroundImage(nil, for: .normal)
        b9.isEnabled = true
        
        counter = 0
        turnLabel.text = "350's Turn"
    }
    
}
