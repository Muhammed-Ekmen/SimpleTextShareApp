//
//  ViewController.swift
//  SimpleTextShareApp
//
//  Created by Semih Ekmen on 24.02.2023.
//
/*
What we have done? Usage of some UI components. These are Share property with a button, progressBar with textField and switch for change theme.

SHARE PROPERTY
 * if you want to set up auto adjusting line count according to inside text,you should set up 0 to line in the storyboard.
 * the way of the share property, you gotta create UIActivityViewController like alert. Check the shareButtonAction and comments.
 * if you want to check action, go to the message app and just paste it. you will see :)
 
SWITCH USAGE
 * 
*/
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loremLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func shareButtonAction(_ sender: UIButton) {
        let activityCtrl:UIActivityViewController = UIActivityViewController(activityItems: [loremLabel.text ?? "NONE"], applicationActivities: nil)
        // activityItems is what you want share.
        present(activityCtrl, animated: true) // it similar to alert dialog.
    }
    
}

