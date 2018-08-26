//
//  TabHomeViewController.swift
//  ProyecyoHack
//
//  Created by Alejandro on 8/25/18.
//  Copyright © 2018 com.AlexStudios.proyectoHack. All rights reserved.
//

import UIKit
import Firebase
class TabHomeViewController: UITabBarController {

    var treatments : Treatment = Treatment()
    var arrayTreatments : [Treatment] = []
    var arrayMedicina : [Medicine] = []
    var arrayDocs : [String] = []
    var doctores : [Doctors] = []

  
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings

     

        
        
        let collRef = db.collection("patients").document(Auth.auth().currentUser?.uid ?? "").collection("treatments").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let dictionary = document.data() as! [String : Any]
                    var note = ""
                    let fecha = dictionary["date"] as! String
                    
                    if(dictionary["notes"] as? String != nil)
                    {
                        note = dictionary["notes"] as! String
                    }
                    
                    let medicinas = dictionary["medicine"] as! [Any]
                    
                    
                    for i in medicinas
                    {
                        let objeto = i as! [String : Any]
                        let name = objeto["name"] as! String
                        let dosis = objeto["dosage"] as! [String : Any]
                        
                        let medicine1 = Medicine(quantity: dosis["quantity"] as! String, frecuency: dosis["frequency"] as! String, duration: dosis["duration"] as! String, notes: note)
                        self.arrayMedicina.append(medicine1)
                    }
                    let datosDoc = dictionary["prescribedBy"] as! [String : Any]
                    let idDoc = datosDoc["id"] as! String
                    let nombreDoc = datosDoc["name"] as! String
                    
                    self.treatments = Treatment(date: fecha, notes: note, medicine: self.arrayMedicina, id: idDoc, name: nombreDoc)
                    
                    
                    self.arrayTreatments.append(self.treatments)

                    var agregar = true
                    
                    if( self.arrayDocs.count == 0)
                    {
                        let docRef = db.collection("doctors").document(idDoc)
                        docRef.getDocument { (document, error) in
                            if let document = document, document.exists {
                                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                                print("Document data: \(dataDescription)")
                                
                                let dictionary = document.data() as! [String : Any]
                                let info = dictionary["basicInfo"] as! [String : Any]
                                let name = info["name"] as! String
                                let birth = info["birthDate"] as! String
                                let contact = dictionary["contactInfo"] as! [String : Any]
                                let email = contact["email"] as! String
                                let phone = contact["phone"] as! String
                         
                                let profesional = dictionary["professionalInfo"] as! [String : Any]
                                let cedula = profesional["cedula"] as! String
                                let special = profesional["specialty"] as! String
                                let title = profesional["title"] as! String
                                
                                let doc = Doctors(name: name, birthDate: birth, phone: Int(phone)!, email: email, cedula: cedula, specialty: special, title: title)
                                self.doctores.append(doc)
                                //                                print(dictionary)
                                //
                                
                                //                print(self.person.getName())
                            } else {
                                print("Document does not exist")
                            }
                        }
                    }
                    else
                    {
                    for i in self.arrayDocs
                    {
                        if(i == idDoc)
                        {
                            agregar = false
                        }
                    
                    }
                    if(agregar)
                    {
                        self.arrayDocs.append(idDoc)
                        let docRef = db.collection("doctors").document(idDoc)
                        docRef.getDocument { (document, error) in
                            if let document = document, document.exists {
                                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                                let dictionary = document.data() as! [String : Any]
                                let info = dictionary["basicInfo"] as! [String : Any]
                                let name = info["name"] as! String
                                let birth = info["birthDate"] as! String
                                let contact = dictionary["contactInfo"] as! [String : Any]
                                let email = contact["email"] as! String
                                let phone = contact["phone"] as! String
                                
                                let profesional = dictionary["professionalInfo"] as! [String : Any]
                                let cedula = profesional["cedula"] as! String
                                let special = profesional["specialty"] as! String
                                let title = profesional["title"] as! String
                                
                                let doc = Doctors(name: name, birthDate: birth, phone: Int(phone)!, email: email, cedula: cedula, specialty: special, title: title)
                                self.doctores.append(doc)
//                                print("Document data: \(dataDescription)")
                                
                                //                    let dictionary = document.data() as! [String : Any]
                                //                                print(dictionary)
                                //
                                
                                //                print(self.person.getName())
                            } else {
                                print("Document does not exist")
                            }
                        }
                    }
                    }
            
                   
//                    for i in self.arrayDocs
//                    {
//                        if(i.getName() != nombreDoc)
//                        {
//
//
//
//                        }
//                    }
                }
                
            }
            
        }
        
        for i in self.arrayDocs
        {
            print(i)
       
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
/*
 
 */
