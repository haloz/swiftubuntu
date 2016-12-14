/*
 * ### error handling ###
 */

enum PrinterError: Error {
	case outOfPaper
	case noToner
	case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
	if printerName == "NeverHasToner" {
		throw PrinterError.noToner
	}
	return "Job sent"
}

// throws noToner error
do {
	let printerResponse = try send(job: 1040, toPrinter: "NeverHasToner")
	print(printerResponse)
} catch PrinterError.onFire {
	print("I'll just put this over here, with the rest of the fire")
} catch let printerError as PrinterError {
	print("Printer error: \(printerError)")
} catch {
	print(error)
}

// use try? to convert the result to an optional
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "NeverHasToner")

