//
//  ViewController.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit
import MaterialComponents
import Firebase
import SkyFloatingLabelTextField
import AudioToolbox

class Menu: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var enterButton: MDCButton!
    @IBOutlet weak var logInButton: MDCFlatButton!
    
    @IBOutlet weak var registerButton: MDCFlatButton!
   
    @IBOutlet weak var emailLabel: SkyFloatingLabelTextField!
    @IBOutlet weak var activity: UIActivityIndicatorView!

    @IBOutlet weak var register2: MDCButton!
    
    @IBOutlet weak var passwordLabel: SkyFloatingLabelTextField!
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        activity.isHidden = true
        enterButton.isHidden = true
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        let db = Firestore.firestore()
        db.settings = settings
//               let db = Firestore.firestore()
//        let docRef = db.collection("doctors").document("LFLbfuL5LnPoDgxreFtn")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
                // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    @IBAction func regresarMenu(unwindSegue: UIStoryboardSegue)
    {
        
    }

    @IBAction func logIn()
    {
        logInButton.isHidden = true
        registerButton.isHidden = true
        emailLabel.isHidden = false
        passwordLabel.isHidden = false
        enterButton.isHidden = false
        register2.isHidden = false
       
    }
    
    @IBAction func enter() {
        activity.isHidden = false
    activity.startAnimating()
        
        Auth.auth().signIn(withEmail: emailLabel.text!, password: passwordLabel.text!, completion: { (user, error) in
            if let user = Auth.auth().currentUser
            {
                if !user.isEmailVerified{
                    let alertVC = UIAlertController(title: "Error", message: "Sorry. Your email address has not yet been verified. Do you want us to send another verification email to \(String(describing: self.emailLabel.text!)).", preferredStyle: .alert)
                    let alertActionOkay = UIAlertAction(title: "Okay", style: .default) {
                        (_) in
                        Auth.auth().currentUser?.sendEmailVerification { (error) in
                            // ...
                        }
                    }
                    let alertActionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    alertVC.addAction(alertActionOkay)
                    alertVC.addAction(alertActionCancel)
                    self.present(alertVC, animated: true, completion: nil)
                    self.activity.isHidden = true
           
                } else {
                    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                    self.performSegue(withIdentifier: "perfil", sender: self)
                }
            } else
            {
                 let alertVC = UIAlertController(title: "Correo no registrado", message: "Registrate para poder continuar", preferredStyle: .alert)
                let alertActionOkay = UIAlertAction(title: "Ok", style: .default) {
                    (_) in
                }
                alertVC.addAction(alertActionOkay)
                self.present(alertVC, animated: true, completion: nil)
                
            }
            
        }
        )
    activity.stopAnimating()
    activity.isHidden = true
    }
    
    
    
    @IBAction func quitaTecladoAbajo()
    {
        view.endEditing(true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let user = Auth.auth().currentUser
        {
            if user.isEmailVerified
            {
                self.performSegue(withIdentifier: "perfil", sender: self)
            }
        }
    }
    
    
}

