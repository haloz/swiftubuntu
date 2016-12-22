import Foundation

class Gigasecond {
	static let dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
	var birthday: Date

	var description: String {
		let gigasecondBefore = gigasecondDate()
		let formatter = DateFormatter()
		formatter.dateFormat = Gigasecond.dateFormat
		formatter.timeZone = TimeZone(identifier: "GMT")
		formatter.locale = Locale(identifier: "en_US_POSIX")
		return formatter.string(from: gigasecondBefore)
	}

	func gigasecondDate() -> Date {
		let seconds = 1000000000
		let calendar = Calendar(identifier: .gregorian)
		// func date(byAdding: NSCalendar.Unit, value: Int, to: Date, options: NSCalendar.Options = [])
		return calendar.date(byAdding: .second, value: seconds, to: birthday)!
	}

	static func convertToDatetime(_ dateAsString: String) -> Date? {
		let formatter = DateFormatter()
		formatter.dateFormat = Gigasecond.dateFormat
		formatter.timeZone = TimeZone(identifier: "GMT")
		formatter.locale = Locale(identifier: "en_US_POSIX")
		return formatter.date(from: dateAsString)		
	}

	// failable initializer
	init?(from birthday: String) {
		if let converted = Gigasecond.convertToDatetime(birthday) {			
			self.birthday = converted
		} else {
			return nil
		}
	}
}
