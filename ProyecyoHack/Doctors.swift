import UIKit

class Doctors: Person {
    var cedula : String!
    var specialty : String!
    var title : String!
    var photoURL : String!


    override init()
    {
        super.init()

        var patient1: [Patients] = []
        
        self.cedula = ""
        self.specialty = ""
        self.title = ""

   
    }    

    init (name: String, birthDate: String, phone: Int, email: String, cedula: String, specialty: String, title: String){
        super.init(name: name, birthDate: birthDate, phone: phone, email: email)

        self.cedula = cedula
        self.specialty = specialty
        self.title = title

         // Revisar los arreglos
    }

    func getCedula() -> String {
        return self.cedula
    }
    func getSpecialty() -> String {
        return self.specialty
    }
    func getTitle() -> String {
        return self.title
    }
    

    func setCedula(cedula: String) {
        self.cedula = cedula
    }
    func setSpecialty(specialty: String) {
        self.specialty = specialty
    }
    func setTitle(title: String) {
        self.title = title
    }
  
  

    
}
