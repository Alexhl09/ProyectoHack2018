

//
//  Configuracion.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit
import Firebase
import SwiftyButton




class Configuracion: UIViewController {
    
    @IBOutlet weak var button: FlatButton!
     var handle: AuthStateDidChangeListenerHandle?
    @IBOutlet weak var delete: FlatButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.color = .cyan
       
        delete.color = .red
        delete.highlightedColor = .orange
        delete.cornerRadius = 5
        button.highlightedColor = .blue
        button.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutSession(_ sender: FlatButton) {
        let user = Auth.auth().currentUser
        do
        {
            try! Auth.auth().signOut()
        }
        let viewController:Menu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menu") as! Menu
        
        self.present(viewController, animated: true, completion: nil)
        
    
    }
    
    
    
    @IBAction func deleteAction()
    {
        let user = Auth.auth().currentUser
        
        let alert = UIAlertController(title: "Seguro que deseas borrar tu cuenta", message: "", preferredStyle: .alert)
        let alertActionOkay = UIAlertAction(title: "Si", style: .default) {
            (_) in
            Auth.auth().currentUser?.delete(completion: { (err) in
                print(err?.localizedDescription)
            }
            )
            let viewController:Menu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menu") as! Menu
            
            self.present(viewController, animated: true, completion: nil)
        }
        
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .default) {
            (_) in
        }
        alert.addAction(alertActionOkay)
        alert.addAction(alertActionCancel)
        self.present(alert, animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
