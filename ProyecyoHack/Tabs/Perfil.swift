//
//  Perfil.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit
import Firebase

class Perfil: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var handle: AuthStateDidChangeListenerHandle?
    @IBOutlet weak var tabla: UITableView!
      var person : Person = Person()

    
    @IBOutlet weak var bienvenida: UILabel!
  
   
    
     var infoTitulo : [String] = [""]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tabber  = tabBarController as! TabHomeViewController
        if(tabber.arrayTreatments.count < 3)
        {
            return tabber.arrayTreatments.count
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let tabber  = tabBarController as! TabHomeViewController
        cell.textLabel?.text = "Receta del Dr. \(tabber.arrayTreatments[indexPath.row].getName())"
        cell.detailTextLabel?.text = "\(tabber.arrayTreatments[indexPath.row].getDate())"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        tabla.delegate = self
        tabla.dataSource = self
      
        let docRef = db.collection("patients").document(Auth.auth().currentUser?.uid ?? "")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
           
                let dictionary = document.data() as! [String : Any]
//                print(dictionary)
                let dic2 = dictionary["contactInfo"] as! [String : Any]
                let dic3 = dictionary["basicInfo"] as! [String : Any]

                self.person = Person(name: dic3["name"] as! String, birthDate: dic3["name"] as! String, phone:  dic2["phone"] as! Int, email: (Auth.auth().currentUser?.email)!)
//

                self.bienvenida.text = "Bienvenido \(self.person.getName())"
                
                //                print(self.person.getName())
            } else {
                print("Document does not exist")
            }
        }
        
      
        
//        let doctRef = db.collection("patients").document(Auth.auth().currentUser?.uid ?? "").collection("co").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    let dictionary = document.data() as! [String : Any]
//
//                    let fecha = dictionary["date"] as! String
//                    let medicinas = dictionary["medicine"] as! [Any]
//
//
//                    for i in medicinas
//                    {
//                        let objeto = i as! [String : Any]
//                        let name = objeto["name"] as! String
//                        let dosis = objeto["dosage"] as! [String : Any]
//
//                        let medicine1 = Medicine(quantity: dosis["quantity"] as! String, frecuency: dosis["frecuency"] as! String, duration: dosis["duration"] as! String, notes: objeto["notes"] as! String)
//                        self.arrayMedicina.append(medicine1)
//                    }
//
//
//                }
//
//            }
//
//        }
        
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {    self.tabla.reloadData()
        }
      
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
//        let tabber  = tabBarController as! TabHomeViewController
//        print(tabber.person.getPhone())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func regresarPerfil(unwindSegue: UIStoryboardSegue)
    {
        
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
