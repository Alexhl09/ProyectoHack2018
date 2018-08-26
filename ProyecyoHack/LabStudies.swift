class LabStudies {
	var name: String!
	var type: String!
	var doctor: String!
	var file: String!
	var date: String!

	init() {
		self.name = ""
		self.type = ""
		self.doctor = ""
		self.file = ""
		self.date = ""
	}

	init(name: String, type: String, doctor: String, file: String, date: String) {
		self.name = name
		self.type = type
		self.doctor = doctor
		self.file = file
		self.date = date	
	}

	func getName() -> String {
		return self.name
	}
	func getType() -> String {
		return self.type
	}
	func getDoctor() -> String {
		return self.doctor
	}
	func getFile() -> String {
		return self.file
	}
	func getDate() -> String {
		return self.date
	}

	func setName(name: String){
		self.name = name
	}
	func setType(type: String){
		self.type = type
	}
	func setFile(file: String){
		self.file = file
	}
	func setDoctor(doctor: String){
		self.doctor = doctor
	}
	func setDate(date: String){
		self.date = date
	}
}