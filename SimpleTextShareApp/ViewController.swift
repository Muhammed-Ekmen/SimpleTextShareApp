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
 * we have added the switch from library on storyboard. Also, we have added the a button for show to how to reach switch from button.
 
PROGRESS BAR WITH TEXTFIELD
 

*/
import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var loremLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var exaTextField: UITextField!
    @IBOutlet weak var exaProgressBar: UIProgressView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exaTextField.delegate = self
        indicator.stopAnimating()
        indicator.isHidden = true
    }

    @IBAction func shareButtonAction(_ sender: UIButton) {
        let activityCtrl:UIActivityViewController = UIActivityViewController(activityItems: [loremLabel.text ?? "NONE"], applicationActivities: nil)
        // activityItems is what you want share.
        present(activityCtrl, animated: true) // it similar to alert dialog.
    }
    
    
    @IBAction func changeTheme(_ sender: UIButton) {
        themeSwitch.setOn(!themeSwitch.isOn, animated: true)   //setOn function changes the off/on situation.
        switchAction(themeSwitch)                             // we could use the our switchAction function but it has needed the UISwitch parameter.
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        self.view.backgroundColor = self.view.backgroundColor == .white ? .darkGray : .white  // in here, we have changed the background color.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let lenght = Float(textField.text?.count ?? 1)/10
        if lenght < 1 {
            exaProgressBar.setProgress(lenght, animated: true)
        }else{
            exaProgressBar.setProgress(1.0, animated: true)
        }
        return true
    }
    
    @IBAction func indicatorProcess(_ sender: UIButton) {
        if indicator.isAnimating == true {
            indicator.stopAnimating()
            indicator.isHidden = true
        }else{
            indicator.isHidden = false
            indicator.startAnimating()
        }
    }
}

