import UIKit

class Person {
	var name : String!
	var birthDate: String!
	var phone : Int!
	var email : String!

	init () {
		self.name = ""
		self.birthDate = ""
		self.phone = 0
		self.email = ""
	}

	init (name: String, birthDate: String, phone: Int, email: String){
		self.name = name
		self.birthDate = birthDate
		self.phone = phone
		self.email = email
	}

	func getName() -> String{
		return self.name
	}
	func getBirthDate() -> String {
		return self.birthDate
	}
	func getPhone() -> Int {
		return self.phone
	}
	func getEMail() -> String {
		return self.email
	}

	func setName(name: String) {
		self.name = name
	}
	func setBirthDate(birthDate: String) {
		self.birthDate = birthDate
	}
	func setPhone(phone: Int) {
		self.phone = phone
	}
	func setEMail(email: String) {
		self.email = email
	}
}
