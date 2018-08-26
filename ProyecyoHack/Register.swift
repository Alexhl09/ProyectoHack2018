//
//  Register.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase
import UICheckbox_Swift
import TransitionButton

class Register: UIViewController, UITextFieldDelegate {
 

    var handle: AuthStateDidChangeListenerHandle?
    @IBOutlet weak var terminos: UICheckbox!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: SkyFloatingLabelTextField!
    @IBOutlet weak var emailLabel: SkyFloatingLabelTextField!
    
    @IBOutlet weak var password: SkyFloatingLabelTextField!
    @IBOutlet weak var phone: SkyFloatingLabelTextField!
    
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var password2: SkyFloatingLabelTextField!
    private var dia : Int = 0
    private var mes : Int = 0
    private var ano : Int = 0
   
   
    @IBOutlet weak var continuarButton: TransitionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = "Fecha de nacimiento:"
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        let db = Firestore.firestore()
        db.settings = settings
        
            continuarButton.backgroundColor = .red
        continuarButton.tintColor = .white
        continuarButton.setTitle("Continuar", for: .normal)
        continuarButton.cornerRadius = 10
        continuarButton.spinnerColor = .white
        continuarButton.addTarget(self, action: #selector(continuar), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func date(_ sender: UIDatePicker) {
        let componenets = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        
        let day = componenets.day!
        let month = componenets.month!
        let year = componenets.year!
        dateLabel.text = "Fecha de nacimiento: \(day)/ \(month)/ \(year)"
        dia = day
        mes = month
        ano = year
       
    }
    
    
  
    
    @IBAction func continuar(_ sender: TransitionButton) {
        sender.startAnimation()
      var bool = false
        var fecha = ""
       if(date.date.description != "1990-01-01 18:00:00 +0000")
       {
      
        bool = true
        fecha = "\(self.ano)-\(self.mes)-\(self.dia)"
        
        }
        guard let name = nameLabel.text else {return}
        guard let mail = emailLabel.text else {return}
        guard let pass = password.text else {return}
        guard let pass2 = password2.text else {return}
        guard let phoneNumer = phone.text else {return}
    
        var number : Int = 0
        number = Int(phoneNumer) ?? 0
        print(number)
        
        let db = Firestore.firestore()
        if(pass == pass2 && pass != "")
        {
            if(terminos.isSelected)
            {
         
            if(bool)
            {
            Auth.auth().createUser(withEmail: mail, password: pass, completion: {user, error in
                if (error == nil && user != nil )
                {
                    db.collection("patients").document((Auth.auth().currentUser?.uid)!).setData(
                    [ "basicInfo" :
                    [
                        
                        "name": name,
                        "birthDate": fecha,
                        "uid" : (Auth.auth().currentUser?.uid)!
                    ],
                       "contactInfo" :
                        [
                          "phone": number,
                        "correo": (Auth.auth().currentUser?.email)!
                        ]
                    ]


                    ) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                            Auth.auth().currentUser?.sendEmailVerification { (error) in
                                // ...
                            }
                                self.performSegue(withIdentifier: "regreso", sender: self)
                        }
                    }
                
                }
            })
            }else
                
            {
                let alert = UIAlertController(title: "Fecha inválida", message: "Verifica que este seleccionado", preferredStyle: .alert)
                let alertActionOkay = UIAlertAction(title: "Ok", style: .default) {
                    (_) in
                }
                alert.addAction(alertActionOkay)
                self.present(alert, animated: true, completion: nil)
                }
            }else
            {
                let alert = UIAlertController(title: "No has aceptado los terminos y condiciones", message: "Verifica que este seleccionado", preferredStyle: .alert)
                let alertActionOkay = UIAlertAction(title: "Ok", style: .default) {
                    (_) in
                }
                alert.addAction(alertActionOkay)
                self.present(alert, animated: true, completion: nil)
            }
        }
        else
        {
            let alert = UIAlertController(title: "Contraseñas no coinciden", message: "Verifica que los datos esten correctos \(String(describing: self.nameLabel.text!))", preferredStyle: .alert)
            let alertActionOkay = UIAlertAction(title: "Ok", style: .default) {
                (_) in
            }
            alert.addAction(alertActionOkay)
            self.present(alert, animated: true, completion: nil)
        }
        sender.stopAnimation(animationStyle: .shake,completion :
            {
               print("Barra terminada")
        })
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
    @IBAction func quitaTecladoAbajo()
    {
        view.endEditing(true)
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
